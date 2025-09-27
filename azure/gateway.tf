resource "azurerm_virtual_network_gateway" "test-gateway" {
  resource_group_name = azurerm_resource_group.test-rg.name
  location            = azurerm_resource_group.test-rg.location
  name                = "test-gateway"
  type                = "Vpn"
  sku                 = "Basic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.test-gateway-subnet.id
    public_ip_address_id          = azurerm_public_ip.test-pub-ip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "test-pub-ip" {
  resource_group_name = azurerm_resource_group.test-rg.name
  location            = azurerm_resource_group.test-rg.location
  name                = "test-pub-ip"
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_local_network_gateway" "test-local-gateway" {
  resource_group_name = azurerm_resource_group.test-rg.name
  location            = azurerm_resource_group.test-rg.location
  name                = "test-local-gateway"
  gateway_fqdn        = var.private_fqdn
  address_space       = ["192.168.1.0/24"]
}

resource "azurerm_virtual_network_gateway_connection" "test-gateway-connection" {
  resource_group_name        = azurerm_resource_group.test-rg.name
  location                   = azurerm_resource_group.test-rg.location
  virtual_network_gateway_id = azurerm_virtual_network_gateway.test-gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.test-local-gateway.id
  name                       = "test-gateway-connection"
  type                       = "IPsec"
  shared_key                 = var.PSK
}