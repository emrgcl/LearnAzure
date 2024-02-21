# crate a variable with a default value
variable "location" {
    description = "The location/region where the resources will be created"
    type        = string
    default     = "West Europe"
}
# crate variable for resource group name
variable "rg_id" {
    description = "The name of the identity subscription resource group"
    type        = string
    default     = "rg-id-prd-001"
}

variable "rg_con" {
    description = "The name of the connectivity subscription resource group"
    type        = string
    default     = "rg-con-prd-001"
}

variable "rg_man" {
    description = "The name of the management subscription resource group"
    type        = string
    default     = "rg-man-prd-001"
}
variable "rg_wrk" {
    description = "The name of the workload subscription resource group"
    type        = string
    default     = "rg-wrk-prd-001"
}
variable "subid_con" {
    description = "The subscription id for the connectivity subscription"
    type        = string
}
variable "subid_id" {
    description = "The subscription id for the identity subscription"
    type        = string
}
variable "subid_man" {
    description = "The subscription id for the management subscription"
    type        = string
}
variable "subid_wrk" {
    description = "The subscription id for the workload subscription"
    type        = string
}