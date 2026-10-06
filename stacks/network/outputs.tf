output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "Subnet IDs by subnet name. Used by the app stack."
}

output "vnet_id" {
  value       = module.network.vnet_id
  description = "ID of the virtual network."
}