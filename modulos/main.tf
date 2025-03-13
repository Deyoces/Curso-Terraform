

# Crear grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

module "vnet" {
  source         = "./vnet"
  vnet_location  = azurerm_resource_group.rg.location
  vnet_rg_name   = azurerm_resource_group.rg.name
  vnet_name      = var.vnet_name
  subnet_name    = var.subnet_name
  public_ip_name = var.public_ip_name
}
module "nsg" {
  source       = "./nsg"
  nsg_location = azurerm_resource_group.rg.location
  nsg_rg_name  = azurerm_resource_group.rg.name
  nsg_name     = var.nsg_name
}
module "vm" {
  source               = "./vm"
  nic_name             = var.nic_name
  vmuser_name          = var.vmuser_name
  subnet_id            = module.vnet.subnet_id
  rg_name              = azurerm_resource_group.rg.name
  nsg_id               = module.nsg.network_security_group_id
  nsg_name             = var.nsg_name
  location             = azurerm_resource_group.rg.location
  public_ip_address_id = module.vnet.public_ip_address_id
  vm_name              = var.vm_name
  vmuserpwd            = var.vmuserpwd
  vmwsi_name           = var.vmwsi_name
}