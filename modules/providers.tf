terraform {
  required_version = "1.5.7"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.9.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/enthuzest"
  personal_access_token = "phkdklqnplc3zez36oijbyp2vmofa3xbdvvbu6a3g2ntoi2dhufa"
}