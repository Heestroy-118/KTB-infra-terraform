output "ec2_sg_id" {
  description = "Security Group ID for EC2 instance"
  value       = aws_security_group.ec2_sg.id
}
