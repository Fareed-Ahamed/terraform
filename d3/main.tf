module "backend" {
  source        = "./modules/backend"
  bucket_name   = var.bucket_name
  dynamodb_name = var.dynamodb_name
}

terraform {
  backend "s3" {}
}