#declaramos los proveedores que usaremos
#el de azure y el de Cloud Adoption Framework  (caf)
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