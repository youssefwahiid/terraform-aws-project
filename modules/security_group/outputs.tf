output "public_alb_sg_id" {
  description = "ID of the public ALB security group"
  value       = aws_security_group.public_alb_sg.id
}

output "internal_alb_sg_id" {
  description = "ID of the internal ALB security group"
  value       = aws_security_group.internal_alb_sg.id
}
output "public_web_sg_id" {
  description = "ID of the security group for public web instances"
  value       = aws_security_group.public_web_sg.id
}

output "private_web_sg_id" {
  description = "ID of the security group for private web instances"
  value       = aws_security_group.private_web_sg.id
}
