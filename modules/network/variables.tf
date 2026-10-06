variable "rg_name" {
  type        = string
  description = "Name of the resource group."
}

variable "location" {
  type        = string
  description = "Azure region where the network resources are deployed."
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group."
}

variable "address_space" {
  type        = string
  description = "Address space for the virtual network."
}

variable "subnets" {
  type = map(object({
    newbits = number
    netnum  = number
  }))

  description = "Subnets to create inside the virtual network."
}