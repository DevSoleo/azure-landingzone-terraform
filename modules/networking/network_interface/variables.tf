variable "name" {}
variable "rg_name" {}
variable "location" {
    type        = string
    default     = "francecentral"
}

variable "subnet_id" {}
variable "public_ip_id" {
    default = null
}