output "workspace_resource_id" {
  value       = azurerm_log_analytics_workspace.log.id
  description = "The workspace id for the application insights"
} 