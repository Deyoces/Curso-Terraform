resource "azurerm_resource_group" "rg" {
    name     =var.rg_name
    location = var.rg_location
}
module "azurefunctions" {
  source  = "aminespinoza10/azurefunctions/azurerm"
  version = "1.0.0"
  # insert the 5 required variables here
  rg_name = azurerm_resource_group.rg.name
  rg_location = azurerm_resource_group.rg.location
  storage_account_name = var.storage_account_name
  app_service_name = var.app_service_name
  function_name = var.function_name
 app_service_plan_sku_tier = "Basic"
 app_service_plan_sku_size = "B2"
}