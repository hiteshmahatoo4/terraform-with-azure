terraform {
  required_providers {
    azurerm = {
         source = "hashicorp/azurerm"
         version = "~> 4.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
    features {
      
    }
}

resource "azurerm_resource_group" "lfr" {
  name     = "lfr-resources"
  location = "Central India"
}

resource "azurerm_storage_account" "lfrstorage" {
  name                     = "lrndata1"
  resource_group_name      = azurerm_resource_group.lfr.name
  location                 = azurerm_resource_group.lfr.location #Implicit Dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}