output "profile_id" {
  value       = cdn_module.profile_id
  description = "The ID of the CDN Profile."
}

output "endpoint_id" {
  value       = cdn_module.endpoint_id
  description = "The ID of the CDN Endpoint."
}

output "storage_principal_id" {
  value       = cdn_module.storage_principal_id
  description = "The Principal ID for the Service Principal associated with the Identity of this Storage Account."
}

output "storage_name" {
  value       = cdn_module.storage_name
  description = "the name of the storage account"
}