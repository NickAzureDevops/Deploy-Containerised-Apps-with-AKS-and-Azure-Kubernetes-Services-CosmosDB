#Create the resource group
resource "azurerm_resource_group" "shared_resource_group" {
name                = var.shared_resource_group
location            = var.location

  tags = {
    environment = var.environment  }
}
