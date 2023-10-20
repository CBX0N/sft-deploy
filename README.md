## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.75.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute-linux"></a> [compute-linux](#module\_compute-linux) | ../tf-modules/azure/compute-linux | n/a |
| <a name="module_core-networking"></a> [core-networking](#module\_core-networking) | ../tf-modules/azure/core-net | n/a |
| <a name="module_key-vault"></a> [key-vault](#module\_key-vault) | ../tf-modules/azure/key-vault | n/a |
| <a name="module_resource-groups"></a> [resource-groups](#module\_resource-groups) | ../tf-modules/azure/resource-groups | n/a |
| <a name="module_storage-account"></a> [storage-account](#module\_storage-account) | ../tf-modules/azure/storage-account | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `""` | no |
| <a name="input_index"></a> [index](#input\_index) | n/a | `string` | `""` | no |
| <a name="input_kv-conf"></a> [kv-conf](#input\_kv-conf) | n/a | <pre>object({<br>    sku_name                        = string<br>    soft_delete_retention_days      = number<br>    enabled_for_disk_encryption     = optional(bool, false)<br>    enabled_for_deployment          = optional(bool, false)<br>    enable_rbac_authorization       = optional(bool, false)<br>    enabled_for_template_deployment = optional(bool, false)<br>    purge_protection_enabled        = optional(bool, false)<br>    access_policy = optional(object({<br>      certificate_permissions = list(string)<br>      key_permissions         = list(string)<br>      secret_permissions      = list(string)<br>      storage_permissions     = list(string)<br>    }))<br>    network_acls = optional(object({<br>      bypass         = string<br>      default_action = string<br>      ip_rules       = list(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `""` | no |
| <a name="input_net-conf"></a> [net-conf](#input\_net-conf) | n/a | <pre>object({<br>    address_space = list(string)<br>    subnet-conf = optional(map(object({<br>      name             = string<br>      nsg              = bool<br>      address_prefixes = list(string)<br>      }))<br>  ) })</pre> | <pre>{<br>  "address_space": []<br>}</pre> | no |
| <a name="input_nsg-conf"></a> [nsg-conf](#input\_nsg-conf) | n/a | <pre>map(object({<br>    name                         = string<br>    access                       = string<br>    description                  = optional(string, "")<br>    direction                    = string<br>    priority                     = string<br>    protocol                     = string<br>    source_address_prefix        = optional(string)<br>    source_port_range            = optional(string)<br>    destination_address_prefix   = optional(string)<br>    destination_port_range       = optional(string)<br>    source_address_prefixes      = optional(list(string))<br>    source_port_ranges           = optional(list(string))<br>    destination_address_prefixes = optional(list(string))<br>    destination_port_ranges      = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_rg-names"></a> [rg-names](#input\_rg-names) | n/a | `set(string)` | `[]` | no |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | `""` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | n/a | `string` | `""` | no |
| <a name="input_str-conf"></a> [str-conf](#input\_str-conf) | n/a | <pre>object({<br>    account_replication_type = string<br>    account_tier             = string<br>    containers = map(object({<br>      name = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_vm-conf"></a> [vm-conf](#input\_vm-conf) | ### | <pre>object({<br>    admin_username = string<br>    size = string<br>    nic = object({<br>      private_ip_address_allocation = string<br>      private_ip_address = string<br>      create_public_ip = bool<br>    })<br>    spot = optional(object({<br>      eviction_policy = string<br>      max_bid_price = string<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kv-id"></a> [kv-id](#output\_kv-id) | ID of Key Vault Created |
| <a name="output_resource-groups"></a> [resource-groups](#output\_resource-groups) | List of Resource Groups Created |
| <a name="output_snet-ids"></a> [snet-ids](#output\_snet-ids) | ID's of Subnets Created |
| <a name="output_str-id"></a> [str-id](#output\_str-id) | ID of Storage Account Created |
| <a name="output_vm-pip"></a> [vm-pip](#output\_vm-pip) | Public IP of VM Created |
| <a name="output_vnet-id"></a> [vnet-id](#output\_vnet-id) | ID of Virtual Network Created |

[![Plan IaC - Live](https://github.com/CBX0N/sft-deploy/actions/workflows/plan-inf.yml/badge.svg?event=push)](https://github.com/CBX0N/sft-deploy/actions/workflows/plan-inf.yml)
