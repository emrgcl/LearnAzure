variable "vnet_id" {
    description = "The address range for Identity VNet"
    type        = list(string)
    default     = ["10.0.0.0/16"]
}

variable "snet-id-dc" {
    description = "The keyvault subnet in identity subscription"
    type        = list(string)
    default     = ["10.0.1.16/27"]
}
variable "snet-id-kv" {
    description = "The domain controller subnet in identity subscription"
    type        = list(string)
    default     = ["10.0.1.32/27"]
}

variable "vnet_con" {
    description = "The address range for Connectivity VNet"
    type        = list(string)
    default     = ["10.1.0.0/16"]
}

variable "snet-con-bas" {
    description = "The bastian subnet in connectivity subscription"
    type        = list(string)
    default     = ["10.1.0.0/27"]
}
variable "snet-con-vpng" {
    description = "The vpn subnet in connectivity subscription"
    type        = list(string)
    default     = ["10.1.0.0/32"]
}
variable "snet-con-afw" {
    description = "The azure firewall subnet in connectivity subscription"
    type        = list(string)
    default     = ["10.1.0.64/27"]
}
variable "vnet_man" {
    description = "The address range for Managment VNet"
    type        = list(string)
    default     = ["10.2.0.0/16"]
}

variable "snet-man-shared" {
    description = "The shared subnet in management subscription"
    type        = list(string)
    default     = ["10.2.0.0/27"]
}
variable "vnet_wrk" {
    description = "The address range for Managment VNet"
    type        = list(string)
    default     = ["10.3.0.0/16"]
}
variable "snet-wrk-shared" {
    description = "The shared subnet in management subscription"
    type        = list(string)
    default     = ["10.3.1.0/27"]
}

