variable "db_username" {}
variable "db_password" {}
variable "db_name" {}
variable "private_subnet_ids" { type = list(string) }
variable "ec2_security_group_id" {}
variable "vpc_id" {} # ADD THIS