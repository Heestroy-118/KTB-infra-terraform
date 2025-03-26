module "launch_template" {
  source                = "../../modules/launch-template"
  name                  = "prod"
  ami_id                = var.ami_id
  instance_type         = "t3.micro"
  key_name              = var.key_name
  security_group_ids    = [module.sg.ec2_sg_id]
  user_data             = file("${path.module}/user_data.sh")
  instance_profile_name = module.iam_role_ssm.instance_profile_name
  tags                  = var.tags
}

module "asg" {
  source             = "../../modules/asg"
  name               = "prod"
  launch_template_id = module.launch_template.launch_template_id
  subnet_ids         = module.subnet.private_subnet_ids
  target_group_arns  = [module.target_group.target_group_arn]
  desired_capacity   = 2
  min_size           = 1
  max_size           = 3
  tags               = var.tags
}

module "sg" {
  source = "../../modules/sg"
  name   = "prod"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}

module "subnet" {
  source               = "../../modules/subnet"
  vpc_id               = module.vpc.vpc_id
  name                 = "prod"
  public_subnet_cidrs  = ["10.0.0.0/26", "10.0.1.0/26"]
  private_subnet_cidrs = ["10.0.2.0/26", "10.0.3.0/26"]
  tags                 = var.tags
}

module "vpc" {
  source     = "../../modules/vpc"
  name       = "prod"
  cidr_block = "10.0.0.0/16"
  tags       = var.tags
}


module "route_table" {
  source = "../../modules/route-table"

  name                   = var.name
  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.subnet.public_subnet_ids
  gateway_id             = module.internet_gateway.igw_id
  destination_cidr_block = "0.0.0.0/0"
  tags                   = var.tags
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"

  name   = var.name
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}

module "target_group" {
  source            = "../../modules/target-group"
  name              ="prod"
  port              = 80
  protocol          = "HTTP"
  vpc_id            = module.vpc.vpc_id
  health_check_path = "/"
  tags              = var.tags
}

module "alb" {
  source = "../../modules/alb"

  name               = "prod"
  subnet_ids         = module.subnet.public_subnet_ids
  security_group_ids = [module.sg.ec2_sg_id]
  listener_port      = 80
  listener_protocol  = "HTTP"
  target_group_arn   = module.target_group.target_group_arn
  tags               = var.tags
}


module "iam_role_ssm" {
  source = "../../modules/iam-role-ssm"
  name   = "prod"
}

module "rds" {
  source              = "../../modules/rds"
  name                = var.name
  subnet_ids          = module.subnet.private_subnet_ids
  security_group_ids  = [module.sg.ec2_sg_id] # SG 공유한다면 OK
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  db_username         = "admin"
  db_password         = "qwerasdf!"
  tags                = var.tags
}
