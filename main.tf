provider "azurerm" {
  
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
}


resource "azurerm_resource_group" "terraform_training" {
  name = var.rg_name
  location = var.rg_location
}
