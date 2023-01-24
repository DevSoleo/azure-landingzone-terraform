# Modules (deployment)
module "resource_group_1" {
  source        = "./modules/resource_group"
  name          = "rg-demo-fr-dev-01"
}

module "virtual_network_1" {
  source        = "./modules/networking/virtual_network"
  
  depends_on    = [module.resource_group_1]

  name     = "vnet-01"

  rg_name       = module.resource_group_1.name
  address_space = ["10.0.0.0/16"]
}

module "dns_servers_1" {
  source = "./modules/networking/virtual_network/dns_server"
  
  depends_on = [
    module.virtual_network_1
  ]

  vnet_id = module.virtual_network_1.id
  servers = [ "10.7.7.2", "10.7.7.7", "10.7.7.1" ]
}

module "subnet_1" {
  source        = "./modules/networking/subnet"

  depends_on    = [module.virtual_network_1]

  name   = "subnet-01"

  vnet_name     = module.virtual_network_1.name
  rg_name       = module.resource_group_1.name
}

module "public_ip_1" {
  source        = "./modules/networking/public_ip"

  name          = "pip-01"
  rg_name       = module.resource_group_1.name
}

module "nic_1" {
  source        = "./modules/networking/network_interface"

  depends_on = [
    module.subnet_1
  ]

  name         = "nic-01" 

  rg_name      = module.resource_group_1.name
  subnet_id    = module.subnet_1.id

  public_ip_id = module.public_ip_1.id
}

module "nsg_1" {
  source        = "./modules/networking/nsg"

  name    = "nsg-01"
  rg_name = module.resource_group_1.name
  nic_id = module.nic_1.id
}

module "nsg_rule_1" {
  source        = "./modules/networking/security_rule"

  name    = "web-rule"
  rg_name = module.resource_group_1.name
  nsg_name = module.nsg_1.name

  priority = 100
  direction = "Inbound"
  access = "Allow"
  destination_port_range = "80"
  description = "Ouverture du port 80"
}

module "vm_1" {
  source        = "./modules/compute/virtual_machine"

  name          = "vm-demo-fr-dev-01"

  rg_name       = module.resource_group_1.name
  nic_id        = module.nic_1.id
}