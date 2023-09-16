terraform {
  required_version = "1.5.7"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.73.0"
    }
  }
  cloud {
    organization = "enthuzest"

    workspaces {
      name = "workspace-azure-devops"
    }
  }
}

data "azurerm_key_vault" "automata_kv" {
  name                = "automata-kv"
  resource_group_name = "automata"
}

data "azurerm_key_vault_secret" "workspace_secret" {
  name         = "workspace-azure-devops"
  key_vault_id = data.azurerm_key_vault.automata_kv.id
}

provider "azuread" {
  client_id     = "0b6c8628-4288-4892-b9e9-c49f1877c005"
  client_secret = azurerm_key_vault_secret.workspace_secret.value
  tenant_id     = "523ab593-8bae-485a-bde2-5fab077a0f92"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  client_id                  = "0b6c8628-4288-4892-b9e9-c49f1877c005"
  client_secret              = azurerm_key_vault_secret.workspace_secret.value
  tenant_id                  = "523ab593-8bae-485a-bde2-5fab077a0f92"
  subscription_id            = "fe790859-8eda-4568-b4d4-07fca54605e4"
}
