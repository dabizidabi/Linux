provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "dabizidabi-terrafrom"
    key            = "testproject/mainstate"
    region         = "eu-west-1"
    dynamodb_table = "s3terraformlock"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}
