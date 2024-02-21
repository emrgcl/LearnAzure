# Create an Azure Firewall
resource "azurerm_firewall" "afw-con-euw-001" {
    provider = azurerm.connectivity
    name                = "afw-con-euw-001"
    sku_name = "AZFW_VNet"
    sku_tier = "Standard"
    location            = azurerm_resource_group.rg-con-prd-001.location
    resource_group_name = azurerm_resource_group.rg-con-prd-001.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.snet-con-afw-euw-001.id
    public_ip_address_id = azurerm_public_ip.pip-con-afw-prd-euw-001.id
  }
}

# Create a public IP address for the Azure Firewall
resource "azurerm_public_ip" "pip-con-afw-prd-euw-001" {
  name                = "pip-con-afw-prd-euw-001"
  location            = azurerm_resource_group.rg-con-prd-001.location
  resource_group_name = azurerm_resource_group.rg-con-prd-001.name
  allocation_method   = "Static"
  sku                 = "Standard"
}