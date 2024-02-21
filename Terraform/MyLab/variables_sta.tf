variable "account_tier" {
    description = "The tier of the storage account"
    type        = string
    default     = "Standard"
}
variable "account_replication_type" {
    description = "The replication type of the storage account"
    type        = string
    default     = "LRS"
}
variable "account_kind" {
    description = "The kind of the storage account"
    type        = string
    default     = "StorageV2"
}