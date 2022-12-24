 resource "azurerm_application_insights" "app_insights" {
  name                = format("insights-aks-%s-festivetech-%s", var.environment, var.location)
  resource_group_name = var.shared_resource_group
  location            = var.location
  workspace_id        = var.workspace_resource_id
  retention_in_days   = var.retention_in_days
  application_type    = "web"
} 
