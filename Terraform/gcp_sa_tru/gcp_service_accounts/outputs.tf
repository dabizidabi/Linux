output "service-account-id" {
  description = "The account ID of the service account."
  value       = [ for account in google_service_account.service-account : account.account_id ]
}

output "service-account-email" {
  description = "The email of the service account."
  value       = [ for account in google_service_account.service-account : account.email ]
}

output "service-account-full-id" {
  description = "The fully-qualified id of the service account."
  value       = [ for account in google_service_account.service-account : account.id ]
}

output "service-account-name" {
  description = "The fully-qualified name of the service account."
  value       = [ for account in google_service_account.service-account : account.name ]
}

output "service-account-role-id" {
  description = "The role ID that should be applied."
  value       = distinct([ for role in google_project_iam_binding.sa-bindings : role.id ])
}

output "service-account-role" {
  description = "The role that should be applied."
  value       = distinct([ for role in google_project_iam_binding.sa-bindings : role.role ])
}