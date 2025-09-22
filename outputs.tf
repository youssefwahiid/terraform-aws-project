######################
# VPC Outputs
######################
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

######################
# EC2 Outputs
######################
output "public_ec2_public_ips" {
  description = "Public IPs of public EC2 instances"
  value       = module.public_ec2.public_ips
}

output "public_ec2_private_ips" {
  description = "Private IPs of public EC2 instances"
  value       = module.public_ec2.private_ips
}

output "backend_ec2_private_ips" {
  description = "Private IPs of backend EC2 instances"
  value       = module.backend_ec2.private_ips
}

######################
# ALB Outputs
######################
output "public_alb_dns_name" {
  description = "DNS name of the public ALB"
  value       = module.alb.public_alb_dns_name
}

output "internal_alb_dns_name" {
  description = "DNS name of the internal ALB"
  value       = module.alb.internal_alb_dns_name
}

######################
# Security Group Outputs
######################
output "public_alb_sg_id" {
  description = "ID of the security group for the public ALB"
  value       = module.sg.public_alb_sg_id
}

output "internal_alb_sg_id" {
  description = "ID of the security group for the internal ALB"
  value       = module.sg.internal_alb_sg_id
}
