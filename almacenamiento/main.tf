#declaramos los proveedores que usaremos
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}
#proporcionamos la suscripción de azure y podemos agregar mas atributos o features
provider "azurerm" {
  features {}
  subscription_id = "f1f8baf7-2069-480c-9341-4034044735f6"
}
#creamos el recurso de tipo grupo de recursos y usamos las variables rg_location y rg_name del archivo variables.tf
#y los valores del archivo valoresvariables.tfvars
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = var.rg_name
}
# Ejemplo de configuración Terraform para una cuenta de almacenamiento en Azure.
#para los valores
#nombre usamos la variable del archivo variables y el valor asignado en el archivo valoresvariables.tfvars
#nombre del grupp de recursos y location usamos la propiedad del mismo nombre del grupo de recursos
resource "azurerm_storage_account" "nombre_cuenta" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
