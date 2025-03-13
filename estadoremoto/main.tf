#Creo un recurso tipo azurecaf_name para el grupo de recursos
#el nommbre sera dev-rg-drf-3caracteresaleatorios-y-z
resource "azurecaf_name" "rg_name" {
  name          = "drf"
  resource_type = "azurerm_resource_group"
  prefixes      = ["dev"]
  suffixes      = ["y", "z"]
  random_length = 3
  clean_input   = true
}

#Creo un recurso tipo azurecaf_name para la cuenta de almacenamiento
#el nommbre sera dev-rg-drf-3caracteresaleatorios
resource "azurecaf_name" "storage_name" {
  name          = "drf"
  resource_type = "azurerm_storage_account"
  prefixes      = ["dev"]
  random_length = 3
  clean_input   = true
}
#Creo un recurso de azure tipo grupo de recursos y para el nombre uso el recurso tipo azurecat_name creado rg_name
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = azurecaf_name.rg_name.result
}
# Ejemplo de configuración Terraform para una cuenta de almacenamiento en Azure.
#y para el nombre uso el recurso tipo azurecat_name creado storage_name
resource "azurerm_storage_account" "nombre_cuenta" {
  name                     = azurecaf_name.storage_name.result
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
