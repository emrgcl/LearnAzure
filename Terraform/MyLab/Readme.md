# My Lab

## Identity Subscription

## resource Groups.

Naming Convention: `rg-<App / Service name>-<Subscription type>-<###>	rg-sharepoint-prod-001`

rg-id-prd-001

### Vnet

Naming Convention:
`vnet-<Subscription type>-<Region>-<###> vnet-shared-eastus2-00

### nic

Naming: convention `NIC	Resource group	nic-<##>-<vmname>-<subscription><###>	nic-02-vmhadoop1-prod-001`
nic-01-vmdc01-identity-001

### Subnet

NAming convention: `Subnet	Virtual networ	snet-<subscription>-<sub-region>-<###>	snet-shared-eastus2-001`

### NSG

Naming Convention: `NSG	Subnet or NIC	nsg-<policy name or appname>-<###>	nsg-weballow-001`

snet-identity-weu-001

| ResourceName            | Resource Group | Terraform Resource Type         | Location | Purpose                     |
| ----------------------- | -------------- | ------------------------------- | -------- | --------------------------- |
| vnet-id-euw-001         | rg-id-prd-001  | azurerm_virtual_network         | weu      | identity vnet (10.0.0.0/16) |
| snet-id-dc-euw-001      | rg-id-prd-001  | azurerm_subnet                  | weu      | dc subnet (10.0.1.0/27)     |
| snet-id-kv-euw-001      | rg-id-prd-001  | azurerm_subnet                  | weu      | kv subnet (10.0.1.32/27)    |
| nic-id-dc-prd-euw-001   | rg-id-prd-001  | azurerm_network_interface       | weu      | nic for vm1 (dc)            |
| vmiddcprde              | rg-id-prd-001  | azurerm_windows_virtual_machine | weu      | dc vm (dc)                  |
| nsg-id-dc-euw-001       | rg-id-prd-001  | azurerm_network_security_group  | weu      | nsg for dc subnet           |
| nsg-id-kv-euw-001       | rg-id-prd-001  | azurerm_network_security_group  | weu      | nsg for kv subnet           |
| kv-id-euw-001           | rg-id-prd-001  | azurerm_key_vault               | weu      | keyvault for identity       |
| peering to connectivity | rg-id-prd-001  | azurerm_key_vault               | weu      | keyvault for identity       |
| route table             | rg-id-prd-001  | azurerm_key_vault               | weu      | keyvault for identity       |
| route table association | rg-id-prd-001  | azurerm_key_vault               | weu      | keyvault for identity       |

suggested resource types:
azurerm_route_table

## Connectivity Subscription

| ResourceName            | Resource Group | Terraform Resource Type                           | Location | Purpose                       |
| ----------------------- | -------------- | ------------------------------------------------- | -------- | ----------------------------- |
| vnet-con-euw-001        | rg-con-prd-001 | azurerm_virtual_network                           | weu      | conn vnet (10.1.0.0/16)       |
| snet-con-bas-euw-001    | rg-con-prd-001 | azurerm_subnet                                    | weu      | bastian subnet (10.1.0.64/27) |
| snet-con-vpn-euw-001    | rg-con-prd-001 | azurerm_subnet                                    | weu      | vpn subnet (10.1.0.0/27)      |
| snet-con-afw-euw-001    | rg-con-prd-001 | azurerm_subnet                                    | weu      | afw subnet (10.1.0.32/27)     |
| afw-con-euw-001         | rg-con-prd-001 | azurerm_firewall                                  | weu      | azure firewall                |
| vpng-con-vpn-euw-001    | rg-con-prd-001 | azurerm_virtual_network_gateway                   | weu      | vpn gateway                   |
| bas-con-prd-euw-001     | rg-con-prd-001 | azurerm_bastion_host                              | weu      | bastion                       |
| nsg-con-bas-euw-001     | rg-con-prd-001 | azurerm_network_security_group                    | weu      | nsg for bastian subnet        |
| nsg-con-afw-euw-001     | rg-con-prd-001 | azurerm_network_security_group                    | weu      | nsg for firwall subnet        |
| nsg-con-vpn-euw-001     | rg-con-prd-001 | azurerm_network_security_group                    | weu      | nsg for vpn subnet            |
| nsg-identity-001        | rg-con-prd-001 | azurerm_subnet_network_security_group_association | weu      | nsg subnet association        |
| kv-identity-weu-001     | rg-con-prd-001 | azurerm_key_vault                                 | weu      | keyvault for identity         |
| pip-con-bas-prd-euw-001 | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for bastian         |
| pip-con-vpn-prd-euw-001 | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for vpn             |
| pip-con-afw-prd-euw-001 | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for afw             |
| peering to identity     | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for afw             |

| peering to management
| peering to workload

## Workload Subscription - Corp

## Management Subscription

| ResourceName            | Resource Group | Terraform Resource Type                           | Location | Purpose                       |
| ----------------------- | -------------- | ------------------------------------------------- | -------- | ----------------------------- |
| vnet-man-euw-001        | rg-con-prd-001 | azurerm_virtual_network                           | weu      | conn vnet (10.1.0.0/16)       |
| snet-con-bas-euw-001    | rg-con-prd-001 | azurerm_subnet                                    | weu      | bastian subnet (10.1.0.64/27) |
| snet-con-vpn-euw-001    | rg-con-prd-001 | storage account                                   | weu      | vpn subnet (10.1.0.0/27)      |
| snet-con-afw-euw-001    | rg-con-prd-001 | log analtcis ws                                   | weu      | afw subnet (10.1.0.32/27)     |
| afw-con-euw-001         | rg-con-prd-001 | azurerm_firewall                                  | weu      | azure firewall                |
| vpng-con-vpn-euw-001    | rg-con-prd-001 | azurerm_virtual_network_gateway                   | weu      | vpn gateway                   |
| bas-con-prd-euw-001     | rg-con-prd-001 | azurerm_bastion_host                              | weu      | bastion                       |
| nsg-con-bas-euw-001     | rg-con-prd-001 | azurerm_network_security_group                    | weu      | nsg for bastian subnet        |
| nsg-con-afw-euw-001     | rg-con-prd-001 | azurerm_network_security_group                    | weu      | nsg for firwall subnet        |
| nsg-con-vpn-euw-001     | rg-con-prd-001 | azurerm_network_security_group                    | weu      | nsg for vpn subnet            |
| nsg-identity-001        | rg-con-prd-001 | azurerm_subnet_network_security_group_association | weu      | nsg subnet association        |
| kv-identity-weu-001     | rg-con-prd-001 | azurerm_key_vault                                 | weu      | keyvault for identity         |
| pip-con-bas-prd-euw-001 | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for bastian         |
| pip-con-vpn-prd-euw-001 | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for vpn             |
| pip-con-afw-prd-euw-001 | rg-con-prd-001 | azurerm_public_ip                                 | weu      | public ip for afw             |
