resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = "eastus"

  tags = {
    terraform = "true"
  }
}