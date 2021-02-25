output "profile_id" {
  value       = azurerm_cdn_profile.profile.id
  description = "The ID of the CDN Profile."
}

output "endpoint_id" {
  value       = azurerm_cdn_endpoint.endpoint.id
  description = "The ID of the CDN Endpoint."
}

output "storage_principal_id" {
  value       = azurerm_storage_account.storeacc.identity[0].principal_id
  description = "The Principal ID for the Service Principal associated with the Identity of this Storage Account."
}

output "storage_name" {
  value       = azurerm_storage_account.storeacc.name
  description = "the name of the storage account"
}