env      = "live"
location = "uksouth"
index    = "001"
service  = "cbx"
tags = {
  terraform = true
}
rg-names = ["net", "kv", "str"]

net-conf = {
  address_space = ["10.100.0.0/20"]
  subnet-conf = {
    app = {
      name             = "app-snet"
      nsg = true
      address_prefixes = ["10.100.1.0/24"]
    }
    data = {
      name             = "data-snet"
      nsg = false
      address_prefixes = ["10.100.2.0/24"]
    }
  }
}

nsg-conf = {
  "allow-ssh" = {
    name = "allow-ssh"
    access = "Allow"
    description = "Allow SSH Access"
    direction = "Inbound"
    priority = "200"
    protocol = "Tcp"
    destination_address_prefixes = [ "*" ]
    destination_port_ranges = [ "22" ]
    source_address_prefixes = [ "*" ]
    source_port_ranges = [ "22" ]
  }
}

kv-conf = {
  sku_name = "standard"
}

str-conf = {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  containers = {
    "backups" = {
      name = "backups"
    }
  }
}