#Sending the resource group name from the resources module to the logging module
output "shared_resource_group_name" {
  value = azurerm_resource_group.shared_resource_group.name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.shared_resource_group.id
  description = "Resource group generated id"
}