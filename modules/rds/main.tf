resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.name}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-rds-subnet-group"
    }
  )
}

resource "aws_db_instance" "rds" {
  identifier             = "${var.name}-rds"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot    = true
  publicly_accessible    = false
  deletion_protection    = false
  multi_az               = false

  backup_retention_period= 7
  backup_window          = "04:00-05:00"
  enabled_cloudwatch_logs_exports = ["error", "slowquery"]

   lifecycle {
    prevent_destroy = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-rds"
    }
  )
}
