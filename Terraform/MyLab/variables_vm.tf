variable vm_license_type {
    description = "The license type for the vm"
    type        = string
    default     = "Windows_Server"
}
variable vm_size {
    description = "The size of the vm"
    type        = string
    default     = "Standard_B2s"
}
variable vm_admin_username {
    description = "The admin username for the vm"
    type        = string
    default     = "serveradmin"
}
variable vm_password {
    description = "The admin password for vm"
    type        = string
    default     = "TestVM!2024$001"
}
variable vm_dc_ipaddress {
    description = "The IP address for dc"
    type        = string
    default     = "10.0.1.4"
}