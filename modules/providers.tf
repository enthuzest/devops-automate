terraform {
  required_version = "1.5.7"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.9.0"
    }
  }
}

data "azurerm_key_vault" "automata_kv" {
  name                = "automata-kv"
  resource_group_name = "automata"
}

data "azurerm_key_vault_secret" "devops_token" {
  name         = "devops-pat-token"
  key_vault_id = data.azurerm_key_vault.automata_kv.id
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/enthuzest"
  personal_access_token = data.azurerm_key_vault_secret.devops_token.value
}
