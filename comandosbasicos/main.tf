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
#creamos el recurso de tipo grupo de recursos
resource "azurerm_resource_group" "rg" {
  location = "MexicoCentral"
  name     = "grupoterraform"
}

#creamos el recurso de tipo grupo de recursos
resource "azurerm_resource_group" "rg2" {
  location = "MexicoCentral"
  name     = "grupoterraform2"
}
#creamos el recurso de tipo grupo de recursos
resource "azurerm_resource_group" "rg3" {
  location = "MexicoCentral"
  name     = var.rg_name
}