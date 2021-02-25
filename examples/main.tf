provider "azurerm" {
  features {}
}

module "cdn_module" {
  source = "../."

  resource_group_name = var.resource_group_name
  appName             = var.appName
  environment         = var.environment
}
