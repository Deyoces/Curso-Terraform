#indicamos donde vamos almacenar el archivo .tfstate y que proveedor en este caso azure
terraform {
  backend "azurerm" {
    storage_account_name = "estadodrf"
    container_name       = "estado"
    key                  = "estado.tfstate"
  }
}

