module "learners_hub" {
  source                = "./modules"
  project_name          = "Leaners Hub"
  description           = "Created for learning"
  service_principal_id  = azuread_service_principal.devops.application_id
  service_principal_key = azuread_application_password.devops.value
}
