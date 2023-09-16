terraform {
  required_version = "1.5.7"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.9.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.73.0"
    }
  }
}

provider "azuread" {
  tenant_id = "523ab593-8bae-485a-bde2-5fab077a0f92"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  tenant_id                  = "523ab593-8bae-485a-bde2-5fab077a0f92"
  subscription_id            = "fe790859-8eda-4568-b4d4-07fca54605e4"
}
