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
  db_location ="armtuts"
}

data "azurerm_sql_server" "kangroodb" {
    name = "kangarooaccount"
    resource_group_name = local.db_location
  
}

resource "azurerm_resource_group" "terraform_training" {
  name = var.rg_name
  location = var.rg_location
}


resource "azurerm_sql_database" "kangarooaccountdb" {
  resource_group_name = local.db_location
  server_name = data.azurerm_sql_server.kangroodb.name
  name = "kangaroosecondb"
  tags = {
    "purpose" = "terraform training"
  }
}

output "rg_name" {
  value = azurerm_resource_group.terraform_training
  description = "output of resource group"
}
