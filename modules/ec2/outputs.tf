
# Outputs the instance IDs
output "instance_ids" {
  description = "List of EC2 instance IDs created by this module"
  value       = [for instance in aws_instance.web : instance.id]
}

# Outputs the public IPs of the EC2 instances
output "public_ips" {
  description = "List of public IP addresses for EC2 instances"
  value       = [for instance in aws_instance.web : instance.public_ip]
}

# Outputs the private IPs of the EC2 instances
output "private_ips" {
  description = "List of private IP addresses for EC2 instances"
  value       = [for instance in aws_instance.web : instance.private_ip]
}
