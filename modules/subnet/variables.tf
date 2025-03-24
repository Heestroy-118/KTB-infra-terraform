variable "name" {
  description = "Subnet dev resource name prefix"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to attach the subnet to"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of Public Subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of Private Subnet CIDR blocks"
  type        = list(string)
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
