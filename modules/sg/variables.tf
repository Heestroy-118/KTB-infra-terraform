variable "name" {
  description = "Security Group dev resource name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to associate with the Security Group"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
