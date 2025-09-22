module "vpc" {
  source = "./modules/vpc"
  name   = "myproject"
  cidr   = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnet_cidrs
  private_subnets_cidrs = var.private_subnet_cidrs
}

module "sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "public_ec2" {
  source             = "./modules/ec2"
  name               = "proxy"
  instance_count     = 2
  ami_id             = data.aws_ami.ubuntu.id
  instance_type      = "t3.micro"
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.sg.public_web_sg_id]
  key_name           = var.key_name
  ssh_user           = var.ssh_user
  ssh_private_key_path = var.ssh_private_key_path
}

module "backend_ec2" {
  source             = "./modules/ec2"
  name               = "be"
  instance_count     = 2
  ami_id             = data.aws_ami.ubuntu.id
  instance_type      = "t3.micro"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.sg.private_web_sg_id]
  key_name           = var.key_name
  ssh_user           = var.ssh_user
  ssh_private_key_path = var.ssh_private_key_path
}


module "alb" {
  source = "./modules/alb"
  name   = "project-alb"

  vpc_id                    = module.vpc.vpc_id
  public_subnets            = module.vpc.public_subnet_ids
  private_subnets           = module.vpc.private_subnet_ids
public_target_instance_ids  = module.public_ec2.instance_ids
internal_target_instance_ids = module.backend_ec2.instance_ids
  public_alb_sg_id            = module.sg.public_alb_sg_id
  internal_alb_sg_id           = module.sg.internal_alb_sg_id
}

