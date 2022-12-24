output "cosmosdb_connection" {
  value = azurerm_cosmosdb_account.cosmosdb_account.connection_strings[0]
  sensitive = false
}
output "cosmos_name" {
  value = azurerm_cosmosdb_account.cosmosdb_account.name
}