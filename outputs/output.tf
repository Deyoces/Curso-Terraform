#se usa para mostrar en consola el valor de id del recurso creado
output "nombrergsalida" {
  value = azurerm_resource_group.rg3.id
}