terraform {
  required_version = ">=1.7.2"

  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "cfustore"
    container_name       = "terraform-bin"
    key                  = "dev.tfstate"
  }
}
