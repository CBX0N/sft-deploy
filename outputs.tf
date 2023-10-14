output "resource-groups" {
  value = { for k, v in module.resource-groups : k => v.resource-group }
  description = "List of Resource Groups Created"
}
output "vnet-id" {
  value = module.core-networking.vnet-id
  description = "ID of Virtual Network Created"
}
output "snet-ids" {
  value = module.core-networking.snet-id
  description = "ID's of Subnets Created"
}
output "kv-id" {
  value = module.key-vault.kv-id
  description = "ID of Key Vault Created"
}

output "str-id" {
  value = module.storage-account.str-id
  description = "ID of Storage Account Created"
}

output "vm-pip" {
  value = module.compute-linux.vm-pip
  description = "Public IP of VM Created"
}