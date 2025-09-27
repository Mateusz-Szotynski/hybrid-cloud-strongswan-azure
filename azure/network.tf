terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.45.1"
    }
  }
  required_version = ">= 1.13.0"
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {

  }
}

resource "azurerm_resource_group" "test-rg" {
  name     = "test-rg"
  location = "west europe"
}

resource "azurerm_virtual_network" "test-vnet" {
  resource_group_name = azurerm_resource_group.test-rg.name
  location            = azurerm_resource_group.test-rg.location
  name                = "test-vnet"
  address_space       = ["10.0.0.0/16"]
  depends_on          = [azurerm_resource_group.test-rg]
}

resource "azurerm_subnet" "test-gateway-subnet" {
  resource_group_name  = azurerm_resource_group.test-rg.name
  virtual_network_name = azurerm_virtual_network.test-vnet.name
  name                 = "GatewaySubnet"
  address_prefixes     = ["10.0.0.0/26"]
  depends_on           = [azurerm_virtual_network.test-vnet]
}

resource "azurerm_subnet" "test-subnet" {
  resource_group_name  = azurerm_resource_group.test-rg.name
  virtual_network_name = azurerm_virtual_network.test-vnet.name
  name                 = "subnet1"
  address_prefixes     = ["10.0.1.0/24"]
  depends_on           = [azurerm_virtual_network.test-vnet]
}

