bucket         = "my-terraform-state-bucket"
key            = "global/s3/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-state-locks"
encrypt        = true