data "azuread_client_config" "current" {}
data "azurerm_subscription" "current" {}

resource "azuread_application" "devops" {
  display_name = "azure-devops-service-principal-owner"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "devops" {
  application_id               = azuread_application.devops.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "devops" {
  display_name          = "devops"
  application_object_id = azuread_application.devops.object_id
}

resource "azurerm_role_assignment" "sp_owner" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.devops.object_id
}

resource "azurerm_key_vault_secret" "arm_client_id" {
  name         = "arm-client-id"
  value        = azuread_application.devops.application_id
  key_vault_id = data.azurerm_key_vault.automata_kv.id
}

resource "azurerm_key_vault_secret" "arm_client_secret" {
  name         = "arm-client-secret"
  value        = azuread_application_password.devops.value
  key_vault_id = data.azurerm_key_vault.automata_kv.id
}