
#En este ejemplo se muestra como se puede crear un grupo de recursos y una cuenta de almacenamiento en Azure
#creamos el recurso de tipo grupo de recursos y usamos las variables rg_location y rg_name del archivo variables.tf
#y los valores del archivo valoresvariables.tfvars
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = var.rg_name
}
# Ejemplo de configuración Terraform para una cuenta de almacenamiento en Azure.
#para los valores
#nombre usamos la variable del archivo variables y el valor asignado en el archivo valoresvariables.tfvars
#nombre del grupo de recursos y location usamos la propiedad del mismo nombre del grupo de recursos
resource "azurerm_storage_account" "nombrecuenta" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# Ejemplo de configuración Terraform para un contenedor en la cuenta de almacenamiento en Azure.
#para los valores
#nombre usamos la variable del archivo variables y el valor asignado en el archivo valoresvariables.tfvars
#id cuenta de almacenamieto y tipo de acceso usamos la propiedad del mismo nombre de la cuenta de almacenamiento y el contenedor
resource "azurerm_storage_container" "contenedor" {
  name                  = var.contenedor_name
  storage_account_id = azurerm_storage_account.nombrecuenta.id
  container_access_type = "container"
  
}