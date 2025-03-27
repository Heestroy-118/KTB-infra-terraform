module "launch_template" {
  source                = "../../modules/launch-template"
  name                  = var.name
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
  name               = var.name
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
  name   = var.name
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}

module "subnet" {
  source               = "../../modules/subnet"
  vpc_id               = module.vpc.vpc_id
  name                 = var.name
  public_subnet_cidrs  = ["10.1.0.0/26", "10.1.1.0/26"] # 수정됨
  private_subnet_cidrs = ["10.1.2.0/26", "10.1.3.0/26"] # 수정됨
  tags                 = var.tags
}

module "vpc" {
  source     = "../../modules/vpc"
  name       = var.name
  cidr_block = "10.1.0.0/16"
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
  name              = var.name
  port              = 80
  protocol          = "HTTP"
  vpc_id            = module.vpc.vpc_id
  health_check_path = "/"
  tags              = var.tags
}

module "alb" {
  source = "../../modules/alb"

  name               = var.name
  subnet_ids         = module.subnet.public_subnet_ids
  security_group_ids = [module.sg.ec2_sg_id]
  listener_port      = 80
  listener_protocol  = "HTTP"
  target_group_arn   = module.target_group.target_group_arn
  tags               = var.tags
}


module "iam_role_ssm" {
  source = "../../modules/iam-role-ssm"
  name   = var.name
}

module "rds" {
  source             = "../../modules/rds"
  name               = "prod-rds" # dev-rds가 아님
  subnet_ids         = module.subnet.private_subnet_ids
  security_group_ids = [module.sg.ec2_sg_id]
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_username        = "admin"
  db_password        = "qwerasdf!"
  tags               = var.tags
}

