resource "azurerm_virtual_network_dns_servers" "dns_servers" {
  virtual_network_id = var.vnet_id
  dns_servers        = var.servers
}