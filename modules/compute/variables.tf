variable "rg_name" {
  type        = string
  description = "Name of the resource group."
}

variable "location" {
  type        = string
  description = "Azure region where the compute resources are deployed."
}

variable "vmss_name" {
  type        = string
  description = "Name of the virtual machine scale set."
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine instances."
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the VMSS will be connected."
}

variable "admin_username" {
  type        = string
  description = "Administrator username for the virtual machines."
}

variable "admin_password" {
  type        = string
  description = "Administrator password for the virtual machines."
  sensitive   = true
}