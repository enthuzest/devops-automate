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