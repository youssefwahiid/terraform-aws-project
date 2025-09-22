output "public_alb_dns_name" {
  description = "DNS name of the public ALB"
  value       = aws_lb.public.dns_name
}

output "internal_alb_dns_name" {
  description = "DNS name of the internal ALB"
  value       = aws_lb.internal.dns_name
}

output "public_target_group_arn" {
  description = "ARN of the public target group"
  value       = aws_lb_target_group.public_tg.arn
}

output "internal_target_group_arn" {
  description = "ARN of the internal target group"
  value       = aws_lb_target_group.internal_tg.arn
}
