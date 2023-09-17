variable "project_name" {
  type        = string
  description = "name of azure devops project"
}
variable "description" {
  type        = string
  description = "description for devops project"
}
variable "service_principal_id" {
  type        = string
  description = "application id of service principal used to authenticate azure"
}
variable "service_principal_key" {
  type        = string
  description = "secret of service principal used to authenticate azure"
}
variable "git_pat_token" {
  type        = string
  description = "github pat token"
}
