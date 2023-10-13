output "resource-groups" {
  value = { for k, v in module.resource-groups : k => v.resource-group }
}
output "vnet-id" {
  value = module.core-networking.vnet-id
}
output "snet-ids" {
  value = module.core-networking.snet-id
}
output "kv-id" {
  value = module.key-vault.kv-id
}

output "str-id" {
  value = module.storage-account.str-id
}

output "vm-pip" {
  value = module.compute-linux.vm-pip
}