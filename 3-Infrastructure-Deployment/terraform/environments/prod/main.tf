locals {
  tags = merge(
    {
      repository = "Festive-Tech-Calender-2022"
    }, var.tags
  )
    environment = var.environment == "dev" ? "dev" : "prod"
}  
module "aks" {
  source                          = "../../src/aks"
  environment                     = local.environment
  location                        = "uksouth"
  tags                            = local.tags
  dns_prefix                      = "festivetechcalender2022"
  ssh_public_key                  = var.ssh_public_key 
  kubernetes_version              = "1.23.8"
  # agent_node                    = 2
  vm_size                         = "standard_b2ms"
  kubernetes_cluster_rbac_enabled = true
  enable_auto_scaling             = true 
  log_analytics_workspace_id      = module.log-analytics.workspace_resource_id
}
module "resource_group" {
  source                        = "../../src/resource_group"
  environment                   = local.environment
  shared_resource_group         = "rg-aks-prod-shared-festivetech-uksouth"
  location                      = "uksouth"
}
module "acr" {
  source                        = "../../src/acr"
  environment                   = local.environment
  shared_resource_group         = module.resource_group.shared_resource_group_name
  location                      = "uksouth"
  tags                          = local.tags
  sku_name                      = "Premium"
}
module "keyvault" {
  source                        = "../../src/keyvault"
  environment                   = local.environment
  location                      = "uksouth"
  tags                          = local.tags
  shared_resource_group         = module.resource_group.shared_resource_group_name
  ssh_public_key                = var.ssh_public_key
  sku_name                      = "standard"
  secret_permissions            = ["Get", "List", "Set", "Delete", "Purge", "Recover"]
  key_permissions               = ["Get"]
  storage_permissions           = ["Get", "List"]
}
module "cosmosdb" {
  source                        = "../../src/cosmosdb"
  environment                   =  local.environment
  location                      = "uksouth"
  tags                          = local.tags
  shared_resource_group         = module.resource_group.shared_resource_group_name
  offer_type                    = "Standard"
  cosmosdbaccount_kind          = "MongoDB"
}
module "app-insights" {
  source                        = "../../src/app-insights"
  environment                   =  local.environment
  location                      = "uksouth"
  tags                          = local.tags
  shared_resource_group         = module.resource_group.shared_resource_group_name
  retention_in_days             = "30"
  workspace_resource_id         = module.log-analytics.workspace_resource_id
}
module "log-analytics" {
  source                        = "../../src/log-analytics"
  environment                   =  local.environment
  location                      = "uksouth"
  tags                          = local.tags
  shared_resource_group         = module.resource_group.shared_resource_group_name
  workspace_sku                 = "PerGB2018"
}

resource "azurerm_role_assignment" "aks-acr-rg" {
  scope                = module.resource_group.resource_group_id
  role_definition_name = "Acrpull"
  principal_id         = module.aks.kubelet_object_id

  depends_on = [
    module.aks,
    module.acr
  ]
}
