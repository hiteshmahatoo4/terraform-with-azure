terraform {
  required_providers {
    azurerm = {
         source = "hashicorp/azurerm"
         version = "~> 4.0"
    }
  }
  required_version = ">=1.9.0"
  backend "azurerm" {
      resource_group_name  = "tfstate-hm"
      storage_account_name = "tfstate7486"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
    features {
      
    }
}

variable "environment" {
    type = string
    description = "The Environment type"
    default = "staging"
}

locals {
  common_tags = {
    environment = "dev"
    lob = "banking"
    stage = "alpha"
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
    environment = local.common_tags.stage
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.lfrstorage.name
}