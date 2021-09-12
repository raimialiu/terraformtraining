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
  db_location ="dockerswarmtuts"
}

data "azurerm_sql_server" "kangroodb" {
    name = "kangarooaccount2"
    resource_group_name = local.db_location
  
}

resource "azurerm_resource_group" "terraform_training" {
  name = var.rg_name
  location = var.rg_location
}

resource "local_file" "name" {
  content = "simple content"
  filename = "hello.txt"
}

# resource "azurerm_sql_database" "kangarooaccountdb" {
#   resource_group_name = local.db_location
#   depends_on = [
#     data.azurerm_sql_server.kangroodb
#   ]
#   server_name = data.azurerm_sql_server.kangroodb.id
#   name = "kangaroosecondb"
#   location = local.rg_location
#   tags = {
#     "purpose" = "terraform training"
#   }
# }

# output "rg_name" {
#   value = azurerm_resource_group.terraform_training
#   description = "output of resource group"
# }

# output "db_instance" {
#   value = azurerm_sql_database.kangarooaccountdb.id
# }


# output "servername" {
#   value = azurerm_sql_database.kangarooaccountdb.server_name
# }