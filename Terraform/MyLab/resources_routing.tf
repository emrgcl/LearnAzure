resource "azurerm_route_table" "rt-id-euw-001" {
  provider = azurerm.identity
  name                          = "rt-id-euw-001"
  resource_group_name =  azurerm_resource_group.rg-id-prd-001.name
  location            =  azurerm_resource_group.rg-id-prd-001.location
  disable_bgp_route_propagation = true

  route {
    name           = "udr-id-to-man-euw-001"
    address_prefix = var.subid_man[0]
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw-con-euw-001.ip_configuration[0].private_ip_address
}
  route {
    name           = "udr-id-to-wrk-euw-001"
    address_prefix = var.subid_wrk[0]
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw-con-euw-001.ip_configuration[0].private_ip_address
}
}
resource "azurerm_subnet_route_table_association" "rta-id-dc-euw-001" {
  provider = azurerm.identity
  subnet_id      = azurerm_subnet.snet-id-dc-euw-001.id
  route_table_id = azurerm_route_table.rt-id-euw-001.id
}
resource "azurerm_subnet_route_table_association" "rta-id-kv-euw-001" {
  provider = azurerm.identity
  subnet_id      = azurerm_subnet.snet-id-kv-euw-001.id
  route_table_id = azurerm_route_table.rt-id-euw-001.id
}

resource "azurerm_route_table" "rt-man-euw-001" {
  provider = azurerm.management
  name                          = "rt-man-euw-001"
  resource_group_name =  azurerm_resource_group.rg-man-prd-001.name
  location            =  azurerm_resource_group.rg-man-prd-001.location
  disable_bgp_route_propagation = true

  route {
    name           = "udr-man-to-id-euw-001"
    address_prefix = var.subid_id[0]
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw-con-euw-001.ip_configuration[0].private_ip_address
}
  route {
    name           = "udr-man-to-wrk-euw-001"
    address_prefix = var.subid_wrk[0]
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw-con-euw-001.ip_configuration[0].private_ip_address
}
}
resource "azurerm_subnet_route_table_association" "rta-man-shared-euw-001" {
  provider = azurerm.management
  subnet_id      = azurerm_subnet.snet-man-shared-euw-001.id
  route_table_id = azurerm_route_table.rt-man-euw-001.id
}

resource "azurerm_route_table" "rt-wrk-euw-001" {
  provider = azurerm.workload
  name                          = "rt-wrk-euw-001"
  resource_group_name =  azurerm_resource_group.rg-wrk-prd-001.name
  location            =  azurerm_resource_group.rg-wrk-prd-001.location
  disable_bgp_route_propagation = true

  route {
    name           = "udr-wrk-to-id-euw-001"
    address_prefix = var.subid_id[0]
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw-con-euw-001.ip_configuration[0].private_ip_address
}
  route {
    name           = "udr-wrk-to-man-euw-001"
    address_prefix = var.subid_man[0]
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw-con-euw-001.ip_configuration[0].private_ip_address
}
}
resource "azurerm_subnet_route_table_association" "rta-man-shared-euw-001" {
  provider = azurerm.workload
  subnet_id      = azurerm_subnet.snet-wrk-shared-euw-001.id
  route_table_id = azurerm_route_table.rt-man-euw-001.id
}