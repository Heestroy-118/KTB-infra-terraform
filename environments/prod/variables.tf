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