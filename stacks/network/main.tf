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
  vnet_name = "vnet-al-${var.environment}"
  nsg_name  = "nsg-al-${var.environment}"
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

module "network" {
  source = "../../modules/network"

  rg_name       = azurerm_resource_group.rg.name
  location      = azurerm_resource_group.rg.location
  vnet_name     = local.vnet_name
  nsg_name      = local.nsg_name
  address_space = var.address_space
  subnets       = var.subnets
}