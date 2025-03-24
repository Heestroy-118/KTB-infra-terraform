variable "name" {
  description = "Internet Gateway dev resource name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the Internet Gateway will be attached"
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
