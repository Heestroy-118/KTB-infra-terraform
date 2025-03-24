variable "name" {
  description = "RDS dev resource name prefix"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of Security Group IDs to associate with RDS"
  type        = list(string)
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "allocated_storage" {
  description = "RDS allocated storage size (in GB)"
  type        = number
}

variable "db_username" {
  description = "RDS database username"
  type        = string
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
