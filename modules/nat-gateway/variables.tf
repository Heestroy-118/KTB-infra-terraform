variable "name" {
  description = "NAT Gateway dev resource name prefix"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet to place the NAT Gateway in"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
