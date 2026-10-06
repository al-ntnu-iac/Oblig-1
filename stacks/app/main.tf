terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

locals {
  rg_name   = "rg-iac-al-${var.environment}"
  vmss_name = "vmss-al-${var.environment}"
}

data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = "${var.environment}/network.tfstate"
    use_azuread_auth     = true
  }
}

module "compute" {
  source = "../../modules/compute"

  rg_name        = local.rg_name
  location       = var.location
  vmss_name      = local.vmss_name
  vm_size        = var.vm_size
  subnet_id      = data.terraform_remote_state.network.outputs.subnet_ids["app"]
  admin_username = var.admin_username
  admin_password = var.admin_password
}