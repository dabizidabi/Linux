provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "dabizidabi-terrafrom"
    key            = "mngm/s3"
    region         = "eu-west-1"
    dynamodb_table = "s3terraformlock"
  }
}

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = var.bucket-name

  lifecycle {
    prevent_destroy = "true"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  acl    = "private"
}


resource "aws_dynamodb_table" "s3_terraform_state_lock" {
  name         = var.dynamodb-lock-table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB S3 Terraform State Lock Table"
  }
}
