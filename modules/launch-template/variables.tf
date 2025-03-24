variable "name" {
  description = "Launch Template dev resource name prefix"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 SSH Key Pair name"
  type        = string
}

variable "security_group_ids" {
  description = "List of Security Group IDs to associate with EC2 instances"
  type        = list(string)
}

variable "user_data" {
  description = "User data script to initialize EC2 instance"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
