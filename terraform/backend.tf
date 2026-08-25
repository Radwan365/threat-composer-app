terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstateradwan2026"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
