variable "law_sku" {
    description = "The sku for the log analytics workspace"
    type        = string
    default     = "PerGB2018"
  
}
variable "law_retention_in_days" {
    description = "The retention in days for the log analytics workspace"
    type        = number
    default     = 100
}