resource "azurerm_public_ip" "pip-con-vpn-prd-euw-001" {
    provider = azurerm.connectivity
  name                = "pip-con-vpn-prd-euw-001"
  location            = azurerm_resource_group.rg-con-prd-001.location
  resource_group_name = azurerm_resource_group.rg-con-prd-001.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_virtual_network_gateway" "vpng-con-vpn-euw-001" {
    provider = azurerm.connectivity
  name                = "vpng-con-vpn-euw-001"
  location            = azurerm_resource_group.rg-con-prd-001.location
  resource_group_name = azurerm_resource_group.rg-con-prd-001.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.pip-con-vpn-prd-euw-001.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.snet-con-vpn-euw-001.id
  }
}
