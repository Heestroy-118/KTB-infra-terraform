variable "name" {
  description = "ASG dev resource name prefix"
  type        = string
}

variable "launch_template_id" {
  description = "ID of the launch template to attach"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs where ASG instances will launch"
  type        = list(string)
}

variable "target_group_arns" {
  description = "List of Target Group ARNs for Load Balancer"
  type        = list(string)
}

variable "desired_capacity" {
  description = "ASG desired EC2 instance count"
  type        = number
}

variable "min_size" {
  description = "ASG minimum EC2 instance count"
  type        = number
}

variable "max_size" {
  description = "ASG maximum EC2 instance count"
  type        = number
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
