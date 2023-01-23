variable "name" {}

variable "rg_name" {}
variable "nsg_name" {}

variable "priority" {}
variable "direction" {}
variable "access" {}
variable "protocol" {
    default = "Tcp"
}
variable "source_port_range" {
    default = "*"
}
variable "destination_port_range" {
    default = "*"
}

variable "description" {
    default = ""
}