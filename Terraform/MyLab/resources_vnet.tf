resource "azurerm_virtual_network" "vnet-id-euw-001" {
    provider = azurerm.identity
    name                = "vnet-id-euw-001"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg-id-prd-001.name
    address_space       = var.vnet.id
    #dns_servers         = ["10.220.4.11","10.220.4.12"]

    tags = {
        environment = "platform"
    }
}
resource "azurerm_subnet" "snet-id-dc-euw-001" {
    provider = azurerm.identity
    name                 = "snet-id-dc-euw-001"
    resource_group_name  = azurerm_resource_group.rg-id-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-id-euw-001.name
    address_prefixes     = var.snet-id-dc

}
resource "azurerm_subnet" "snet-id-kv-euw-001" {
    provider = azurerm.identity
    name                 = "snet-id-kv-euw-001"
    resource_group_name  = azurerm_resource_group.rg-id-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-id-euw-001.name
    address_prefixes     = var.snet-id-kv
}

resource "azurerm_virtual_network" "vnet-con-euw-001" {
    provider = azurerm.connectivity
    name                = "vnet-con-euw-001"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg-con-prd-001.name
    address_space       = var.vnet.con
    #dns_servers         = ["10.220.4.11","10.220.4.12"]

    tags = {
        environment = "platform"
    }
}
resource "azurerm_subnet" "snet-con-bas-euw-001" {
    provider = azurerm.connectivity
    name                 = "snet-con-bas-euw-001"
    resource_group_name  = azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-con-euw-001.name
    address_prefixes     = var.snet-con-bas

}
resource "azurerm_subnet" "snet-con-vpng-euw-001" {
    provider = azurerm.connectivity
    name                 = "snet-con-vpng-euw-001"
    resource_group_name  = azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-con-euw-001.name
    address_prefixes     = var.snet-con-vpng

}
resource "azurerm_subnet" "snet-con-afw-euw-001" {
    provider = azurerm.connectivity
    name                 = "snet-con-afw-euw-001"
    resource_group_name  = azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-con-euw-001.name
    address_prefixes     = var.snet-con-afw

}


resource "azurerm_virtual_network" "vnet-man-euw-001" {
    provider = azurerm.management
    name                = "vnet-man-euw-001"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg-man-prd-001.name
    address_space       = var.vnet.man
    #dns_servers         = ["10.220.4.11","10.220.4.12"]

    tags = {
        environment = "platform"
    }
}
resource "azurerm_subnet" "snet-man-shared-euw-001" {
    provider = azurerm.management
    name                 = "snet-man-shared-euw-001"
    resource_group_name  = azurerm_resource_group.rg-man-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-man-euw-001.name
    address_prefixes     = var.snet-man-shared

}
resource "azurerm_virtual_network" "vnet-wrk-euw-001" {
    provider = azurerm.workload
    name                = "vnet-wrk-euw-001"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg-wrk-prd-001.name
    address_space       = var.vnet.wrk
    #dns_servers         = ["10.220.4.11","10.220.4.12"]

    tags = {
        environment = "platform"
    }
}
resource "azurerm_subnet" "snet-man-shared-euw-001" {
    provider = azurerm.workload
    name                 = "snet-wrk-shared-euw-001"
    resource_group_name  = azurerm_resource_group.rg-wrk-prd-001.name
    virtual_network_name = azurerm_virtual_network.vnet-wrk-euw-001.name
    address_prefixes     = var.snet-wrk-shared

}