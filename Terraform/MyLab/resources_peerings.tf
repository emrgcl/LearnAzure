
resource "azurerm_virtual_network_peering" "peer-con-to-id-euw-001" {
    provider = azurerm.connectivity
    name                      = "peer-con-to-id-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-con-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-id-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peer-con-to-man-euw-001" {
    provider = azurerm.connectivity
    name                      = "peer-con-to-man-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-con-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-man-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peer-con-to-man-euw-001" {
    provider = azurerm.connectivity
    name                      = "peer-con-to-man-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-con-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-man-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peer-con-to-wrk-euw-001" {
    provider = azurerm.connectivity
    name                      = "peer-con-to-wrk-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-con-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-con-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-wrk-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peer-id-to-con-euw-001" {
    provider = azurerm.identity
    name                      = "peer-id-to-con-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-id-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-id-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-con-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peer-man-to-con-euw-001" {
    provider = azurerm.management
    name                      = "peer-man-to-con-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-man-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-man-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-con-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peer-wrk-to-con-euw-001" {
    provider = azurerm.workload
    name                      = "peer-wrk-to-con-euw-001"
    resource_group_name       =  azurerm_resource_group.rg-wrk-prd-001.name
    virtual_network_name      = azurerm_virtual_network.vnet-wrk-euw-001.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-con-euw-001.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}
