variable "rg-names" {
  type    = set(string)
  default = []
}

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
    name = string
    access = string
    description = optional(string,"")
    direction = string
    priority = string
    protocol = string
    source_address_prefixes = list(string)
    source_port_ranges = list(string)
    destination_address_prefixes = list(string)
    destination_port_ranges = list(string)
  }))
}

####

variable "kv-conf" {
  type = object({
    sku_name = string
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