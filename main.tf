# Modules (deployment)
module "resource_group_1" {
  source        = "./modules/resource_group"
  name          = "testrg1"
}

module "virtual_network_1" {
  source        = "./modules/networking/virtual_network"
  
  depends_on    = [module.resource_group_1]

  name     = "myvnet"

  rg_name       = module.resource_group_1.name
}

module "virtual_network_2" {
  source        = "./modules/networking/virtual_network"

  depends_on    = [module.resource_group_1]

  name     = "myvnetaizeo"

  rg_name       = module.resource_group_1.name
}

module "subnet_1" {
  source        = "./modules/networking/subnet"

  depends_on    = [module.virtual_network_2]

  name   = "bipou"

  vnet_name     = "myvnetaizeo"
  rg_name       = module.resource_group_1.name
}

module "nic_1" {
  source        = "./modules/networking/network_interface"

  depends_on = [
    module.subnet_1
  ]

  name         = "cartereso" 

  rg_name      = module.resource_group_1.name
  subnet_id    = module.subnet_1.id
  
}

module "vm_1" {
  source        = "./modules/compute/virtual_machine"

  name          = "vmname"

  rg_name       = module.resource_group_1.name
  nic_id        = module.nic_1.id
}