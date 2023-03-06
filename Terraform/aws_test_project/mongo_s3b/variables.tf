variable "region" {
  description = "Resources region"
  type        = string
  default     = "eu-west-1"
}

variable "bucket-name" {
  description = "The name of s3 bucket"
  type        = string
  default     = "dabizidabi-terrafrom"
}

variable "tfstate-path" {
  description = "The path where state is written to"
  type        = string
  default     = "mngm/s3"
}

variable "dynamodb-lock-table" {
  description = "Name of DynamoDB Table to use for state locking and consistency."
  type        = string
  default     = "s3terraformlock"
}
