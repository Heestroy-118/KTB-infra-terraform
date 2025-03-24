output "vpc_id" {
  description = "The ID of the VPC in dev environment"
  value       = aws_vpc.this.id
}
