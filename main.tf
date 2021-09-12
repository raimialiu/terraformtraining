provider "azurerm" {
  features {
    
  }
}

variable "default_location" {
  description = "default location for all resource"
  default = "West Europe"
}

variable "rg_name" {
  description = "resource group name"
}

variable "rg_location" {
  description = "default resource group location"
#   validation {
#     condition = can(index(["West US", "East US"],var.location) >= 0)
#     error_message ="the location must be east or west us"
#   }
}


resource "azurerm_resource_group" "terraform_training" {
  name = var.rg_name
  location = var.rg_location
}

output "rg_name" {
  value = azurerm_resource_group.terraform_training
  description = "output of resource group"
}
