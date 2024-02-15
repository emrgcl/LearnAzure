# Provider configuration
provider "azurerm" {
  features {}
}

# Resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "West Europe"
}

# Virtual network 1
resource "azurerm_virtual_network" "vlan1" {
  name                = "vlan1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Subnet 1
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vlan1.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Virtual machine 1
resource "azurerm_windows_virtual_machine" "vm1" {
  name = "vm1"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_B1ls"
  admin_username      = "adminuser"
  admin_password      = "Password123!"
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  network_interface_ids = [azurerm_network_interface.nic1.id]
}

# Network interface 1
resource "azurerm_network_interface" "nic1" {
  name                = "nic1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  ip_configuration {
    name                          = "config1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual network 2
resource "azurerm_virtual_network" "vlan2" {
  name                = "vlan2"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Subnet 2
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vlan2.name
  address_prefixes     = ["10.1.1.0/24"]
}

# Virtual machine 2
resource "azurerm_windows_virtual_machine" "vm2" {
  name = "vm2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_B1ls"
  admin_username      = "adminuser"
  admin_password      = "Password123!"
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  network_interface_ids = [azurerm_network_interface.nic2.id]
}

# Network interface 2
resource "azurerm_network_interface" "nic2" {
  name                = "nic2"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  ip_configuration {
    name                          = "config2"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

# VNet peering
resource "azurerm_virtual_network_peering" "peering" {
  name                         = "vlan1-to-vlan2"
  resource_group_name          = azurerm_resource_group.example.name
  virtual_network_name         = azurerm_virtual_network.vlan1.name
  remote_virtual_network_id    = azurerm_virtual_network.vlan2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
resource "azurerm_virtual_network_peering" "peering2" {
  name                         = "vlan2-to-vlan1"
  resource_group_name          = azurerm_resource_group.example.name
  virtual_network_name         = azurerm_virtual_network.vlan2.name
  remote_virtual_network_id    = azurerm_virtual_network.vlan1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

# Bastion subnet 1
resource "azurerm_subnet" "bastion_subnet1" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vlan1.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Bastion subnet 2
resource "azurerm_subnet" "bastion_subnet2" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vlan2.name
  address_prefixes     = ["10.1.2.0/24"]
}

# craete the public ip for each bastion subnet
resource "azurerm_public_ip" "bastion1" {
  name                = "bastion1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_public_ip" "bastion2" {
  name                = "bastion2"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# azurerm_bastion_host for each bastion subnbet
resource "azurerm_bastion_host" "bastion1" {
  name                = "bastion1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_configuration {
    name                 = "bastion1"
    subnet_id            = azurerm_subnet.bastion_subnet1.id
    public_ip_address_id = azurerm_public_ip.bastion1.id
  }
}
# bastion for subnet 2
resource "azurerm_bastion_host" "bastion2" {
  name                = "bastion2"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_configuration {
    name                 = "bastion2"
    subnet_id            = azurerm_subnet.bastion_subnet2.id
    public_ip_address_id = azurerm_public_ip.bastion2.id
  }
}


