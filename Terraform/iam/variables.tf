variable "name" {
  description = "Desired name for the IAM user"
  type        = string
  default     = "dabizidabi"
}

variable "group_name" {
  description = "Desired name for the IAM group"
  type        = string
  default     = "admins"
}

variable "aws_iam_group_policy_name" {
  description = "Desired name for group policy"
  type        = string
  default     = "AdministratorAccess"
}

variable "aws_iam_group_membership_name" {
  description = "Desired name for group membership"
  type        = string
  default     = "admins-group-membership"
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = true
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 15
}

variable "iam_access_key_status" {
  description = "Access key status to apply."
  type        = string
  default     = "Active"
}
