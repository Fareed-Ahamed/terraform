variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "availability_zones" { type = list(string) }

variable "instance_type" {}
variable "db_username" {}
variable "db_password" {}
variable "db_name" {}