data "azurerm_key_vault_secret" "git_pat" {
  name         = "devops-git-token"
  key_vault_id = data.azurerm_key_vault.automata_kv.id
}

module "learners_hub" {
  source                = "./modules"
  project_name          = "Leaners Hub"
  description           = "Created for learning"
  service_principal_id  = azuread_service_principal.devops.application_id
  service_principal_key = azuread_application_password.devops.value
  git_pat_token         = data.azurerm_key_vault_secret.git_pat.value
}
