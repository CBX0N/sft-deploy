terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    use_oidc = true
  }
}

provider "azurerm" {
  features {
  }
  use_oidc = true
}

module "resource-groups" {
  for_each = var.rg-names
  source   = "../tf-modules/azure/resource-groups"
  rg-name  = each.value
  location = var.location

  service = var.service
  env     = var.env
  index   = var.index

  tags = var.tags
}

module "core-networking" {
  source   = "../tf-modules/azure/core-net"
  rg-name  = module.resource-groups["net"].resource-group
  location = var.location

  service = var.service
  env     = var.env
  index   = var.index

  net-conf = var.net-conf
  nsg-conf = var.nsg-conf

  tags = var.tags
}

module "key-vault" {
  source   = "../tf-modules/azure/key-vault"
  rg-name  = module.resource-groups["kv"].resource-group
  location = var.location

  service = var.service
  env     = var.env
  index   = var.index

  kv-conf   = var.kv-conf
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  tags = var.tags
}

module "storage-account" {
  source   = "../tf-modules/azure/storage-account"
  rg-name  = module.resource-groups["str"].resource-group
  location = var.location

  service = var.service
  env     = var.env
  index   = var.index

  str-conf = var.str-conf

  tags = var.tags
}

module "compute-linux" {
  source   = "../tf-modules/azure/compute-linux"
  rg-name  = module.resource-groups["app"].resource-group
  location = var.location

  service = var.service
  env     = var.env
  index   = var.index

  vm-conf = var.vm-conf
  snet-id = module.core-networking.snet-id["app"]
  kv-id   = module.key-vault.kv-id
  custom_data = filebase64("./cloudinit.yml")

  tags = var.tags
  depends_on = [ module.key-vault ]
}