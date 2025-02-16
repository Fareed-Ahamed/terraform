output "s3_bucket_name" {
  value = module.backend.bucket_name
}

output "dynamodb_table_name" {
  value = module.backend.dynamodb_name
}