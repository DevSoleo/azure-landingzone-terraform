module "resource_group_1" {
  source        = "./modules/resource_group"
  rg_name       = "testc"
}

module "virtual_network_1" {
  source        = "./modules/networking/virtual_network"
  
  depends_on = [module.resource_group_1]

  vnet_name     = "myvnet"

  rg_name       = "testc"
}

module "virtual_network_2" {
  source        = "./modules/networking/virtual_network"

  depends_on = [module.resource_group_1]

  vnet_name     = "myvnetaizeo"

  rg_name       = "testc"
}

module "subnet_1" {
  source        = "./modules/networking/subnet"

  depends_on = [module.virtual_network_2]

  subnet_name   = "bipou"

  vnet_name     = "myvnetaizeo"
  rg_name       = "testc"
}