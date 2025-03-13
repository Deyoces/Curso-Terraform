#En este ejercicio se muestra como utilizar recursos que ya existen en la nube que fueron
#creados por otros utilizando el bloque data
data "azurerm_resource_group" "rg" {
  name = "estado"
}
#crea un recurso de tipo cuenta de almacenamiento en el grupo de recurso que ya existe
resource "azurerm_storage_account" "sa" {
  name                     = "almacenamientodrf"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}