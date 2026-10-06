variable "environment" {
  type        = string
  description = "Deployment environment, for example dev or prod."
}

variable "location" {
  type        = string
  description = "Azure region where resources are deployed."
  default     = "norwayeast"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine instances."
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for the virtual machines."
  default     = "tfadmin"
}

variable "admin_password" {
  type        = string
  description = "Administrator password for the virtual machines."
  sensitive   = true
}

variable "backend_resource_group_name" {
  type        = string
  description = "Resource group containing the Terraform backend."
}

variable "backend_storage_account_name" {
  type        = string
  description = "Storage account containing the Terraform state."
}

variable "backend_container_name" {
  type        = string
  description = "Container containing the Terraform state."
  default     = "tfstate"
}