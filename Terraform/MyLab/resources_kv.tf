# keyvault resource for identity subscription
resource "azurerm_key_vault" kv-id-euw-001 {
    
  provider = azurerm.identity
  name                = "kv-id-euw-001"
  resource_group_name =  azurerm_resource_group.rg-id-prd-001.name
  location            =  azurerm_resource_group.rg-id-prd-001.location
  sku_name            = var.kv_sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
   purge_protection_enabled = true
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    secret_permissions = [
      "get",
      "list"
    ]
  }
} 