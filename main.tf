module "resource_group_1" {
  source        = "./modules/resource_group"
  rg_name       = "my-rg-now"
}

module "virtual_network_1" {
  source        = "./modules/networking/virtual_network"
  vnet_name     = "myvnet"

  rg_name       = "my-rg-now"
}

module "virtual_network_2" {
  source        = "./modules/networking/virtual_network"
  vnet_name     = "myvnetaizeo"

  rg_name       = "my-rg-now"
}

module "subnet_1" {
  source        = "./modules/networking/subnet"
  subnet_name   = "bipou"

  vnet_name     = "myvnetaizeo"
  rg_name       = "my-rg-now"
}