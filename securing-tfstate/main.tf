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