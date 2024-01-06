# This file is used to configure the backend for the AWS provider
terraform {
  	required_providers {
    		aws = {
      			source  = "hashicorp/aws"
      			version = "~> 3.0"
    		}
  	}
}

# ----------------------------
# Storage
# ----------------------------

# Description: This file contains the configuration for the S3 bucket that will be used to store the Terraform state file.

# Description: Creates an S3 bucket for Terraform state storage
resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
}

# Description: Enables versioning on the Terraform state bucket
resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = var.versioning_status
  }
}

# Description: Enables server-side encryption on the Terraform state bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
  bucket        = aws_s3_bucket.terraform_state.bucket 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.encryption_algorithm
    }
  }
}

# ----------------------------
# Database
# ----------------------------


# Description: Creates a DynamoDB table for Terraform state locking

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.db_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  attribute {
    name = var.attribute_name
    type = var.attribute_type
  }
}