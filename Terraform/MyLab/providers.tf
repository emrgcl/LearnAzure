# Identity: subscription
provider "azurerm" {
  features {}
  subscription_id = var.subid_id
  alias           = "identity"
}

# Connectivity subscription
provider "azurerm" {
  features {}
  subscription_id = var.subid_con
  alias           = "connectivity"
}

# Management Subscription
provider "azurerm" {
  features {}
  subscription_id = var.subid_man
  alias           = "management"
}
# Workload Subscription
provider "azurerm" {
  features {}
  subscription_id = var.subid_wrk
  alias           = "workload"
}
