variable "environment" {
  type        = string
  description = "Deployment environment, for example dev or prod."
}

variable "location" {
  type        = string
  description = "Azure region where resources are deployed."
  default     = "norwayeast"
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
  description = "Subnets to create in the virtual network."

  default = {
    web = {
      newbits = 8
      netnum  = 0
    }
    app = {
      newbits = 8
      netnum  = 1
    }
    data = {
      newbits = 8
      netnum  = 2
    }
  }
}