variable "rg-names" {
  type    = set(string)
  default = []
}

# variable "object_id" {
#   type      = string
#   sensitive = true
# }

variable "location" {
  type    = string
  default = ""
}

variable "service" {
  type    = string
  default = ""
}

variable "env" {
  type    = string
  default = ""
}

variable "index" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

####

variable "net-conf" {
  type = object({
    address_space = list(string)
    subnet-conf = optional(map(object({
      name             = string
      nsg              = bool
      address_prefixes = list(string)
      }))
  ) })
  default = {
    address_space = []
  }
}

variable "nsg-conf" {
  type = map(object({
    name                         = string
    access                       = string
    description                  = optional(string, "")
    direction                    = string
    priority                     = string
    protocol                     = string
    source_address_prefix        = optional(string)
    source_port_range            = optional(string)
    destination_address_prefix   = optional(string)
    destination_port_range       = optional(string)
    source_address_prefixes      = optional(list(string))
    source_port_ranges           = optional(list(string))
    destination_address_prefixes = optional(list(string))
    destination_port_ranges      = optional(list(string))
  }))
}

####

variable "kv-conf" {
  type = object({
    sku_name                        = string
    soft_delete_retention_days      = number
    enabled_for_disk_encryption     = optional(bool, false)
    enabled_for_deployment          = optional(bool, false)
    enable_rbac_authorization       = optional(bool, false)
    enabled_for_template_deployment = optional(bool, false)
    purge_protection_enabled        = optional(bool, false)
    access_policy = optional(object({
      certificate_permissions = list(string)
      key_permissions         = list(string)
      secret_permissions      = list(string)
      storage_permissions     = list(string)
    }))
    network_acls = optional(object({
      bypass         = string
      default_action = string
      ip_rules       = list(string)
    }))
  })
}
#####

variable "str-conf" {
  type = object({
    account_replication_type = string
    account_tier             = string
    containers = map(object({
      name = string
    }))
  })
}

####
variable "vm-conf" {
  type = object({
    admin_username = string
    size = string
    nic = object({
      private_ip_address_allocation = string
      private_ip_address = string
      create_public_ip = bool
    })
    spot = optional(object({
      eviction_policy = string
      max_bid_price = string
    }))
  })
}
variable "ssh_public_key" {
  type = string
  default = ""
}