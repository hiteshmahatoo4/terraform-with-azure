terraform {
  backend "azurerm" {
      resource_group_name  = "tfstate-hm"
      storage_account_name = "tfstate7486"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"
  } 
}
