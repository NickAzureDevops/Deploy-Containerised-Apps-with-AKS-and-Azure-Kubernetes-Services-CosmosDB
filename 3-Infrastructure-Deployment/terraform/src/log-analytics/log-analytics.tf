resource "azurerm_log_analytics_workspace" "log" {
  name                = format("log-%s-festivetechcalender-%s", var.environment, var.location)
  location            = var.location
  resource_group_name = var.shared_resource_group
  sku                 = var.workspace_sku
}

resource "azurerm_log_analytics_solution" "solution" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.log.location
  resource_group_name   = var.shared_resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.log.id
  workspace_name        = azurerm_log_analytics_workspace.log.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}