resource "azurerm_storage_account" "lfrstorage" {
  name                     = "lrndata1"
  resource_group_name      = azurerm_resource_group.lfr.name
  location                 = azurerm_resource_group.lfr.location #Implicit Dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.common_tags.environment
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.lfrstorage.name
}