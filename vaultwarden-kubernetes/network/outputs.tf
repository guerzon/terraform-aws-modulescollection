output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "private_subnet_ids" {
  description = "List of all created private VPCs"
  value       = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  description = "List of all created public VPCs"
  value       = aws_subnet.public[*].id
}