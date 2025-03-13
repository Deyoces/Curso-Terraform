#se usa para mostrar en consola el valor de id del recurso creado
output "keystoragedrf" {
  value     = azurerm_storage_account.nombre_cuenta.primary_connection_string
  sensitive = true
}