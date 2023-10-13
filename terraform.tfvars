#### Resource Groups ####
rg-names = ["net", "kv", "str", "app"]

#### Network Config ####
net-conf = {
  address_space = ["10.100.0.0/20"]
  subnet-conf = {
    app = {
      name             = "app-snet"
      nsg              = true
      address_prefixes = ["10.100.1.0/24"]
    }
    data = {
      name             = "data-snet"
      nsg              = false
      address_prefixes = ["10.100.2.0/24"]
    }
  }
}

nsg-conf = {
  "allow-ssh" = {
    name                       = "allow-ssh"
    access                     = "Allow"
    description                = "Allow SSH Access"
    direction                  = "Inbound"
    priority                   = "200"
    protocol                   = "Tcp"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
}

#### Key Vault Config ####
kv-conf = {
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  enabled_for_deployment      = true
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7
  access_policy = {
    certificate_permissions = ["Get"]
    key_permissions         = ["Get","Create","List","GetRotationPolicy","Update","Delete","Purge","Recover"]
    secret_permissions      = ["Get"]
    storage_permissions     = ["Get"]
  }
  network_acls = {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules       = ["77.98.5.189"]
  }
}

#### Storage Account Config ####
str-conf = {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  containers = {
    "backups" = {
      name = "backups"
    }
  }
}

#### VM Config ####
vm-conf = {
  admin_username = "vmadmin"
  nic = {
    create_public_ip              = true
    private_ip_address            = "10.100.1.10"
    private_ip_address_allocation = "Static"
  }
  size = "Standard_F2"
  size = "Standard_D4as_v5"
  # spot = {
  #   eviction_policy = "Deallocate"
  #   max_bid_price = "-1"
  # }
}