
resource "azurerm_public_ip" "pip-con-bas-prd-euw-001" {
  provider = azurerm.connectivity
  name                = "pip-con-bas-prd-euw-001"
  location            = azurerm_resource_group.rg-con-prd-001.location
  resource_group_name = azurerm_resource_group.rg-con-prd-001.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bas-con-prd-euw-001" {
  provider = azurerm.connectivity
  name                = "bas-bynr-hub-ne-01"
  location            = azurerm_resource_group.rg-con-prd-001.location
  resource_group_name = azurerm_resource_group.rg-con-prd-001.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.snet-con-bas-euw-001.id
    public_ip_address_id = azurerm_public_ip.pip-con-bas-prd-euw-001.id
  }
}