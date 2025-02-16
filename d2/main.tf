module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "ec2_asg" {
  source            = "./modules/ec2_asg"
  instance_type     = var.instance_type
  public_subnet_ids = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
}
module "rds" {
  source                 = "./modules/rds"
  db_username            = var.db_username
  db_password            = var.db_password
  db_name                = var.db_name
  private_subnet_ids     = module.vpc.private_subnet_ids
  ec2_security_group_id  = module.ec2_asg.ec2_security_group_id
  vpc_id                 = module.vpc.vpc_id
}