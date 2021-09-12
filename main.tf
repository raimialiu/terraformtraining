provider "azurerm" {
  features {
    
  }
}

variable "default_location" {
  description = "default location for all resource"
  default = "West Europe"
}

locals {
  rg_name = var.rg_name
  rg_location = var.rg_location
}


resource "azurerm_resource_group" "terraform_training" {
  name = var.rg_name
  location = var.rg_location
}

output "rg_name" {
  value = azurerm_resource_group.terraform_training
  description = "output of resource group"
}
