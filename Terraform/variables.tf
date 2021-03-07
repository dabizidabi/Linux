variable "region" {
  description = "VPC region"
  type        = string
  default     = "us-east-2"
}

variable "azs" {
  description = "Availability zones for subnets"
  type        = list(any)
  default     = ["eu-east-2a", "eu-east-2b", "eu-east-2c"]
}

variable "cidr_block_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.100.0.0/16"
}

variable "net_private_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(any)
  default     = ["10.100.112.0/20", "10.100.128.0/20", "10.100.144.0/20"]
}

variable "net_public_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(any)
  default     = ["10.100.10.0/24", "10.100.11.0/24", "10.100.12.0/24"]
}

variable "net_database_cidr_blocks" {
  description = "List of CIDR blocks for database subnets"
  type        = list(any)
  default     = ["10.100.20.0/24", "10.100.21.0/24", "10.100.22.0/24"]
}

variable "net_elasticache_cidr_blocks" {
  description = "List of CIDR blocks for elasticache subnets"
  type        = list(any)
  default     = ["10.100.30.0/24", "10.100.31.0/24", "10.100.32.0/24"]
}

variable "common_tags" {
  description = "Tags to aplly for all resources"
  type        = map(any)
  default = {
    environment = "development"
  }
}
