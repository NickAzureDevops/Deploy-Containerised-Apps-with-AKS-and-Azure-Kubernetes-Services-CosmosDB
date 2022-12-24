resource "azurerm_resource_group" "rg" {
  name                = format("rg-aks-%s-festivetech-%s", var.environment, var.location)
  location            = var.location
}
resource "azurerm_kubernetes_cluster" "default" {
  name                = format("aks-%s-festivetech-%s", var.environment, var.location)
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  
  node_resource_group = format("rg-aks-node-%s-%s", var.environment, var.location)

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }
  default_node_pool {
    name                 = "agent"
    # node_count           = var.agent_node
    vm_size              = var.vm_size
    vnet_subnet_id       = azurerm_subnet.vnet_subnet.id
    type                 = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
    zones                =  ["1", "2", "3"]
    enable_auto_scaling  = var.enable_auto_scaling
    min_count            = 2
    max_count            = 4
  }
  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled = true

  role_based_access_control_enabled = var.kubernetes_cluster_rbac_enabled

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_administrators.id]
  }

  azure_policy_enabled = true
  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }
}
data "azurerm_resource_group" "node_resource_group" {
  name = azurerm_kubernetes_cluster.default.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.default
  ]
}
resource "azurerm_role_assignment" "node_infrastructure_update_scale_set" {
  principal_id         = azurerm_kubernetes_cluster.default.kubelet_identity[0].object_id
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine Contributor"
  depends_on = [
    azurerm_kubernetes_cluster.default
  ]
}