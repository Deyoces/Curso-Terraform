import {
  to = azurerm_storage_account.micuenta
  id= "/subscriptions/f1f8baf7-2069-480c-9341-4034044735f6/resourceGroups/storagerg/providers/Microsoft.Storage/storageAccounts/logstorageaccount23"
}

resource "azurerm_storage_account" "micuenta" {
  name = "logstorageaccount23"  
    resource_group_name = var.rg_name
    location            = var.rg_location
    account_tier = "Standard"
    account_replication_type = "LRS"
}
