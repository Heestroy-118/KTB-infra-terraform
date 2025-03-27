ami_id   = "ami-0c2b8ca1dad447f8a"  
key_name = "personal-project"
name     = "prod"

tags = {
  Project     = "personal-cloud"
  Environment = "prod"
  Owner       = "moonjaehee"
  ManagedBy   = "Terraform"
}

db_username       = "admin"
db_password       = "qwerasdf!"
instance_class    = "db.t3.micro"
allocated_storage = 20