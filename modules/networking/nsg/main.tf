resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name

  tags = {
    terraform = "true"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = var.nic_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}