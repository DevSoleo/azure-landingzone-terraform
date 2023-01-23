variable "name" {}

variable "rg_name" {}
variable "nic_id" {}

variable "location" {
    type = string
    default = "francecentral"
}

variable "vm_size" {
    type = string
    default = "Standard_DS1_v2"
}