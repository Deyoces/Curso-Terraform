# Crear virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.vnet_location
  resource_group_name = var.vnet_rg_name
}

# Create subred
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
# Create public IPs
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.vnet_location
  resource_group_name = var.vnet_rg_name
  allocation_method   = "Static"
}