locals {
  base_name    = format("%s-%s-cdn", var.appName, var.environment)
  storage_name = format("%s%sstorage", var.appName, var.environment)
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storeacc" {
  name                      = local.storage_name
  resource_group_name       = data.azurerm_resource_group.rg.name
  location                  = var.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = true
  tags                      = data.azurerm_resource_group.rg.tags

  static_website {
    error_404_document = var.custom_404_path
  }

  blob_properties {
    cors_rule {
      allowed_methods    = var.allowed_methods
      allowed_origins    = var.allowed_origins
      allowed_headers    = var.allowed_headers
      exposed_headers    = var.exposed_headers
      max_age_in_seconds = var.max_age_in_seconds
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_cdn_profile" "profile" {
  name                = format("%s-profile", local.base_name)
  location            = "global"
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = data.azurerm_resource_group.rg.tags
  sku                 = var.cdn_sku_profile
}

resource "azurerm_cdn_endpoint" "endpoint" {
  name                          = format("%s-ep", local.base_name)
  profile_name                  = azurerm_cdn_profile.profile.name
  location                      = "global"
  resource_group_name           = data.azurerm_resource_group.rg.name
  tags                          = data.azurerm_resource_group.rg.tags
  origin_host_header            = azurerm_storage_account.storeacc.primary_web_host
  querystring_caching_behaviour = "IgnoreQueryString"
  is_http_allowed               = false
  origin {
    name      = "cdnstorage"
    host_name = azurerm_storage_account.storeacc.primary_web_host
  }
}

# resource "null_resource" "add_custom_domain" {
#   count = var.custom_domain_name != null ? 1 : 0
#   depends_on = [
#     azurerm_cdn_endpoint.cdn-endpoint
#   ]

#   provisioner "local-exec" {
#     command = "pwsh ${path.cwd}/Setup-AzCdnCustomDomain.ps1"
#     environment = {
#       CUSTOM_DOMAIN = var.custom_domain_name
#       RG_NAME       = var.resource_group_name
#       FRIENDLY_NAME = var.friendly_name
#     }
#   }
# }