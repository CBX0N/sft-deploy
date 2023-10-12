terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource-groups" {
  source   = "../tf-modules/azure/resource-groups"
  for_each = var.rg-names
  rg-name  = each.value
  location = var.location
  service  = var.service
  env      = var.env
  index    = var.index
  tags     = var.tags
}

module "core-networking" {
  source   = "../tf-modules/azure/core-net"
  rg-name  = module.resource-groups["net"].resource-group
  net-conf = var.net-conf
  nsg-conf = var.nsg-conf
  location = var.location
  service  = var.service
  env      = var.env
  index    = var.index
  tags     = var.tags
}

module "key-vault" {
  source    = "../tf-modules/azure/key-vault"
  rg-name   = module.resource-groups["kv"].resource-group
  kv-conf   = var.kv-conf
  tenant_id = data.azurerm_subscription.current_sub.tenant_id
  location  = var.location
  service   = var.service
  env       = var.env
  index     = var.index
  tags      = var.tags
}

module "storage-account" {
  source    = "../tf-modules/azure/storage-account"
  rg-name   = module.resource-groups["str"].resource-group
  str-conf  = var.str-conf
  tenant_id = data.azurerm_subscription.current_sub.tenant_id
  location  = var.location
  service   = var.service
  env       = var.env
  index     = var.index
  tags      = var.tags
}