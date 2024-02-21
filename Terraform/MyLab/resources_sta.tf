resource "azurerm_storage_account" "sta-man-shared-euw-001" {
  provider = azurerm.management
  name                     = "sta-man-shared-euw-001"
  resource_group_name      = azurerm_resource_group.rg-man-prd-001.name
  location                 = azurerm_resource_group.rg-man-prd-001.location
  account_tier             = var.account_tier
  account_kind             = var.account_replication_type
  account_replication_type = var.account_kind
  public_network_access_enabled = true
  allow_nested_items_to_be_public = false

  /*
  blob_properties {
    change_feed_enabled = true
    versioning_enabled  = false
    container_delete_retention_policy {
    days = 7
    }
    delete_retention_policy {
      days = 7
    }
    restore_policy {
      days = 6
      }
  }
  */

  tags = {
    environment = "management"
  }
}