# el bloque locals permite definir constantes que se puede utulizar para formar los nombre de los recursos
# en este caso se define una constante rg_name que se forma concatenando "dev" con el valor de la variable rg_name
# en el bloque resource se utiliza la constante rg_name para definir el nombre del grupo de recursos
# es parecido a lo que hace el proveedor azurecaf
locals {
          rg_name="dev${var.rg_name}"
}
resource "azurerm_resource_group" "rg" {
    name     =local.rg_name 
    location = var.rg_location
}