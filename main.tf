terraform {
  required_version = "1.15.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {

    organization = "TallaMbunwe"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-97cac49c-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorage-ci" {
  source  = "app.terraform.io/TallaMbunwe/securestorage-ci/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "libostorage1807262235"
}