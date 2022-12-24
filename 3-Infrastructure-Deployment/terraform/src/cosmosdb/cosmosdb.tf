  resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                      = format("cosmos-%s-festivetech-%s", var.environment, var.location)
  location                  = var.location
  resource_group_name       = var.shared_resource_group
  offer_type                = var.offer_type
  kind                      = var.cosmosdbaccount_kind
  enable_automatic_failover = false
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  depends_on = [
    var.shared_resource_group
  ]
  tags = {
    Environment = "dev"
  }
}

resource "azurerm_cosmosdb_mongo_database" "item" {
  name                = "item"
  resource_group_name = var.shared_resource_group
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
  throughput          = 400
  depends_on = [
  azurerm_cosmosdb_account.cosmosdb_account
]
}

resource "azurerm_cosmosdb_mongo_collection" "id" {
  name                = "id"
  resource_group_name = var.shared_resource_group
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name       = azurerm_cosmosdb_mongo_database.item.name

  default_ttl_seconds = "777"
  shard_key           = "uniqueKey"
  throughput          = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}