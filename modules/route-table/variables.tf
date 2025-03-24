variable "name" {
  description = "Route Table dev resource name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the route table will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate with this route table"
  type        = list(string)
}

variable "gateway_id" {
  description = "Internet Gateway ID for the route"
  type        = string
}

variable "destination_cidr_block" {
  description = "CIDR block for the default route"
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
