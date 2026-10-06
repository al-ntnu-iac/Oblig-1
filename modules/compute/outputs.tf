output "vmss_id" {
  value       = azurerm_windows_virtual_machine_scale_set.vmss.id
  description = "ID of the virtual machine scale set"
}

output "vmss_name" {
  value       = azurerm_windows_virtual_machine_scale_set.vmss.name
  description = "Name of the virtual machine scale set"
}