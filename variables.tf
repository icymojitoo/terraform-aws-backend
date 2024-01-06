# ----------------------------
# Storage
# ----------------------------


## Bucket
variable "bucket_name" {
    default     = "momo-dev-tf-state"
}

variable "force_destroy" {
    default     = true
}

## Versioning
variable "versioning_status" {
    default     = "Enabled"
}

## Encryption
variable "encryption_algorithm" {
    default     = "AES256"
}


# ----------------------------
# Database
# ----------------------------

variable "db_name" {
    default     = "terraform-state-locking"
}

variable "billing_mode" {
    default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
    default     = "LockID"
}

variable "attribute_name" {
    default     = "LockID"
}

variable "attribute_type" {
    default     = "S"
}
