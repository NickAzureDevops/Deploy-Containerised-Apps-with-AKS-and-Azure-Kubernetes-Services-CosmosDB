resource "azurerm_container_registry" "acr" {
  name                = format("acr%sfestivetech%s", var.environment, var.location)
  resource_group_name = var.shared_resource_group
  location            = var.location
  sku                 = var.sku_name
  }

