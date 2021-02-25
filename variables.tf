variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that exists in Azure"
}

variable "appName" {
  type        = string
  description = "The base name of the application used in the naming convention."
}

variable "environment" {
  type        = string
  description = "Name of the environment ex (Dev, Test, QA, Prod)"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "westus2"
}

variable "account_kind" {
  type        = string
  description = "The kind of storage account."
  default     = "StorageV2"
}

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "access_tier" {
  type        = string
  description = "The access tier of the storage account."
  default     = "Hot"
}

variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "GRS"
}

variable "custom_404_path" {
  type        = string
  description = "path from your repo root to your custom 404 page"
  default     = "404.html"
}

variable "allowed_methods" {
  type        = list(string)
  description = " A list of http headers that are allowed to be executed by the origin. Valid options are `DELETE`, `GET`, `HEAD`, `MERGE`, `POST`, `OPTIONS`, `PUT` or `PATCH`."
  default = [
    "GET",
    "HEAD"
  ]
}

variable "allowed_origins" {
  type        = list(string)
  description = "A list of origin domains that will be allowed by CORS."
  default     = ["*"]
}

variable "allowed_headers" {
  type        = list(string)
  description = "A list of headers that are allowed to be a part of the cross-origin request."
  default     = []
}

variable "exposed_headers" {
  type        = list(string)
  description = "A list of response headers that are exposed to CORS clients."
  default     = []
}

variable "max_age_in_seconds" {
  type        = number
  description = "The number of seconds the client should cache a preflight response.  Defaults to 2 days"
  default     = 60 * 60 * 24 * 2
}

variable "cdn_sku_profile" {
  type        = string
  description = "The pricing related information of current CDN profile. Accepted values are 'Standard_Akamai', 'Standard_Microsoft', 'Standard_Verizon' or 'Premium_Verizon'."
  default     = "Standard_Akamai"
}

# variable "custom_domain_name" {
#   type        = string
#   description = "The custom domain name to use for your website"
#   default     = null
# }