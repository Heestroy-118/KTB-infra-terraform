variable "ami_id" {
  description = "AMI ID for EC2 launch template"
  type        = string
}

variable "key_name" {
  description = "EC2 SSH key pair name"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "name" {
  description = "Resource name prefix"
  type        = string
}

variable "db_username" {
  description = "RDS DB username"
  type        = string
}

variable "db_password" {
  description = "RDS DB password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS DB instance class"
  type        = string
}

variable "allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
}
