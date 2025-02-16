variable "bucket_name" {
  description = "S3 bucket for storing Terraform state"
  type        = string
}

variable "dynamodb_name" {
  description = "DynamoDB table for state locking"
  type        = string
}