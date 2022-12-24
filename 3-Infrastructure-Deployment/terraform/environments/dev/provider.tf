terraform {

  # The backend configuration defines the Terraform State files need to be stored.
  backend "azurerm" {
  }

  required_version = ">= 0.14"

  # Terraform configurations must declare which providers they require, so that Terraform can install and use them.
  # Provider requirements are declared in a required_providers block.

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.34.0"
    }
  
  }
}
provider "azuread" {
}

# The features block is used to customize the behaviour of certain Azure Provider resources.
# The features block is required for AzureRM provider 2.x but not allowed in version 1.x.
provider "azurerm" {
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}