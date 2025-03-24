variable "name" {
  description = "VPC dev resource name prefix"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
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