output "iam_user_name" {
  description = "The user's name"
  value       = try(aws_iam_user.my-user.name, "")
}

output "iam_user_group" {
  description = "The group's name"
  value       = try(aws_iam_group.admins.name, "")
}

output "iam_user_login_profile_password" {
  description = "The user password"
  value       = try(aws_iam_user_login_profile.my-user, {})
}
