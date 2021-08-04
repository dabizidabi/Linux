output "service-account-id" {
  description = "The account ID of the service account."
  value       = module.service-accounts.service-account-id[*]
}

output "service-account-email" {
  description = "The email of the service account."
  value       = module.service-accounts.service-account-email[*]
}

output "service-account-full-id" {
  description = "The fully-qualified id of the service account."
  value       = module.service-accounts.service-account-full-id[*]
}

output "service-account-name" {
  description = "The fully-qualified name of the service account."
  value       = module.service-accounts.service-account-name[*]
}

output "service-account-role-id" {
  description = "The role ID that should be applied."
  value       = distinct(module.service-accounts.service-account-role-id[*])
}

output "service-account-role" {
  description = "The role that should be applied."
  value       = distinct(module.service-accounts.service-account-role[*])
}