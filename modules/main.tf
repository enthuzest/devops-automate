resource "azuredevops_project" "project" {
  name               = var.project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = var.description
  features = {
    "testplans" = "disabled"
    "artifacts" = "disabled"
  }
}

resource "azuredevops_serviceendpoint_azurerm" "azure_endpoint" {
  project_id                             = azuredevops_project.project.id
  service_endpoint_name                  = "HandsOn"
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "ServicePrincipal"
  credentials {
    serviceprincipalid  = var.service_principal_id
    serviceprincipalkey = var.service_principal_key
  }
  azurerm_spn_tenantid      = "523ab593-8bae-485a-bde2-5fab077a0f92"
  azurerm_subscription_id   = "fe790859-8eda-4568-b4d4-07fca54605e4"
  azurerm_subscription_name = "HandsOn"
}