resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                 = var.vmss_name
  computer_name_prefix = "vmssdemo"
  resource_group_name  = var.rg_name
  location             = var.location
  sku                  = var.vm_size
  instances            = 1

  admin_username = var.admin_username
  admin_password = var.admin_password

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "internal"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}