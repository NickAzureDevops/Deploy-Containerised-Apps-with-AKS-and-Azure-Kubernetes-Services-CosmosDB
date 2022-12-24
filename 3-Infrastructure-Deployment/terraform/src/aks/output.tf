output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}

output "kubelet_object_id" {
  value = azurerm_kubernetes_cluster.default.kubelet_identity[0].object_id
}