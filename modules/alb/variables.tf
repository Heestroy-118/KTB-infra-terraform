variable "name" {
  description = "ALB dev resource name prefix"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Port for ALB Listener"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for ALB Listener"
  type        = string
  default     = "HTTP"
}

variable "target_group_arn" {
  description = "Target Group ARN to forward traffic"
  type        = string
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
