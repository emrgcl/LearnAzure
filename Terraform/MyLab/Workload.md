## Workload Subscription - Corp

| ResourceName              | Resource Group  | Terraform Resource Type                           | Location | Purpose                          |
| ------------------------- | --------------- | ------------------------------------------------- | -------- | -------------------------------- |
| vnet-man-euw-001          | rg-man-prd-001  | azurerm_virtual_network                           | weu      | management vnet (10.2.0.0/16)    |
| snet-man-euw-001          | rg-man-prd-001  | azurerm_subnet                                    | weu      | management subnet (10.2.1.0/27)  |
| sta-man-shared-euw-001    | rg-man-prd-001  | azurerm_storage_account                           | weu      | storage account                  |
| law-man-shared-euw-001    | rg-man-prd-001  | azurerm_log_analytics_workspace                   | weu      | log analytics workspace          |
| rt-man-euw-001            | rg-man-prd-001  | azurerm_route_table                               | weu      | main routing for identity        |
| rta-man-euw-001           | rg-man-prd-001  | azurerm_subnet_route_table_association            | weu      | route assoc for dc               |