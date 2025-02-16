module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "ec2_asg" {
  source         = "./modules/ec2_asg"
  vpc_id         = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_type  = "t2.micro"
}

module "rds" {
  source                 = "./modules/rds"
  db_username            = "admin"
  db_password            = "password123"
  db_name                = "appdb"
  private_subnet_ids     = module.vpc.private_subnet_ids
  ec2_security_group_id  = module.ec2_asg.ec2_security_group_id
  vpc_id                 = module.vpc.vpc_id
}