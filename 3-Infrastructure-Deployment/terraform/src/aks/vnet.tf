resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s-festivetechcalender-%s", var.environment, var.location)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "vnet_subnet" {
  name                 = format("snet-%s-festivetechcalender-%s", var.environment, var.location)
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.240.0.0/16"]
}