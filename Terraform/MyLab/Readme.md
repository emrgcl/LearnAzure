# My Lab 

## Identity Subscription
## resource Groups. 
Naming Convention: `rg-<App / Service name>-<Subscription type>-<###>	rg-sharepoint-prod-001` 


rg-identity-prod-001

### Vnet
Naming Convention:
`vnet-<Subscription type>-<Region>-<###>	vnet-shared-eastus2-001`

### nic
Naming: convention `NIC	Resource group	nic-<##>-<vmname>-<subscription><###>	nic-02-vmhadoop1-prod-001`
nic-01-vmdc01-identity-001

### Subnet
NAming convention: `Subnet	Virtual network	snet-<subscription>-<sub-region>-<###>	snet-shared-eastus2-001`
### NSG
Naming Convention: `NSG	Subnet or NIC	nsg-<policy name or appname>-<###>	nsg-weballow-001`

snet-identity-weu-001
 
| ResourceName               | Resource Group       | Terraform Resource Type                            |  Location | Purpose                |  
| -------------------------- | -------------------- | -------------------------------------------------- | --------- | ---------------------- | 
| vnet-id-euw-001            | rg-identity-prod-001 | azurerm_virtual_network                            | weu       | vnet for identity      |
| snet-id-euw-001	         | rg-identity-prod-001 | azurerm_subnet                                     | weu       | subnet for identity    |
| nic-01-vmdc01-identity-001 | rg-identity-prod-001 | azurerm_network_interface                          | weu       | nic for vm1 (dc)       | 
| vmdc01                     | rg-identity-prod-001 | azurerm_windows_virtual_machine                    | weu       | dc vm (dc)             |
| nsg-identity-001           | rg-identity-prod-001 | azurerm_network_security_group                     | weu       | nsg for the subnet     |
| nsg-identity-001           | rg-identity-prod-001 | azurerm_subnet_network_security_group_association  | weu       | nsg subnet association |
| kv-identity-weu-001        | rg-identity-prod-001 | azurerm_key_vault                                  | weu       | keyvault for identity  |


suggested resource types:
azurerm_route_table

## Connectivity Subscription 

| ResourceName               | Resource Group       | Terraform Resource Type                            |  Location | Purpose                |  
| -------------------------- | -------------------- | -------------------------------------------------- | --------- | ---------------------- | 
| vnet-id-prd-euw-001     | rg-identity-prod-001 | azurerm_virtual_network                            | weu       | vnet for identity      |
| snet-identity-weu-001      | rg-identity-prod-001 | azurerm_subnet                                     | weu       | subnet for identity    |
| nic-01-vmdc01-identity-001 | rg-identity-prod-001 | azurerm_network_interface                          | weu       | nic for vm1 (dc)       | 
| vmiddcprdeuw001	         | rg-identity-prod-001 | azurerm_windows_virtual_machine                    | weu       | dc vm (dc)             |
| nsg-identity-001           | rg-identity-prod-001 | azurerm_network_security_group                     | weu       | nsg for the subnet     |
| nsg-identity-001           | rg-identity-prod-001 | azurerm_subnet_network_security_group_association  | weu       | nsg subnet association |
| kv-identity-weu-001        | rg-identity-prod-001 | azurerm_key_vault                                  | weu       | keyvault for identity  |


## Workload Subscription

## Management Subscription

