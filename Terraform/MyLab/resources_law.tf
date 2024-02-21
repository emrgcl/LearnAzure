# log analytics workspace
resource "azurerm_log_analytics_workspace" "law-man-shared-euw-001" {
  provider = azurerm.management
  name                = "law-man-shared-euw-001"
  location            = azurerm_resource_group.rg-man-prd-001.location
  resource_group_name = azurerm_resource_group.rg-man-prd-001.name
  sku                 = var.law_sku
  retention_in_days   = var.law_retention_in_days
    tags = {
    environment = "management"
  }
}
