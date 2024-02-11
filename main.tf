terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "cfu_azpipetf" {
  name     = "cfu_azpipetf"
  location = "West Europe"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = var.app_name
  location            = azurerm_resource_group.cfu_azpipetf.location
  resource_group_name = azurerm_resource_group.cfu_azpipetf.name

  ip_address_type = "Public"
  dns_name_label  = "dns${var.app_name}01"
  os_type         = "Linux"

  image_registry_credential {
    username = var.client_id
    password = var.client_secret
    server   = "mydockerbin.azurecr.io"
  }

  container {
    name   = var.app_name
    image  = "mydockerbin.azurecr.io/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}