variable "name" {
  description = "Target Group dev resource name prefix"
  type        = string
}

variable "port" {
  description = "Port for target group"
  type        = number
}

variable "protocol" {
  description = "Protocol for target group"
  type        = string
}

variable "target_type" {
  description = "Type of target (instance or ip)"
  type        = string
  default     = "instance"
}

variable "vpc_id" {
  description = "VPC ID where target group will be created"
  type        = string
}

variable "health_check_path" {
  description = "Path for health check"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "personal-cloud"
    Environment = "dev"
    Owner       = "moonjaehee"
    ManagedBy   = "Terraform"
  }
}
