output "launch_template_id" {
  description = "ID of the Launch Template"
  value       = aws_launch_template.this.id
}

output "launch_template_name" {
  description = "Name of the Launch Template"
  value       = aws_launch_template.this.name
}
