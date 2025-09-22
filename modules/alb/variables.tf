variable "name" {
  description = "Base name for ALBs"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for the internet-facing ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for the internal ALB"
  type        = list(string)
}

variable "public_alb_sg_id" {
  description = "Security group ID for the public ALB"
  type        = string
}

variable "internal_alb_sg_id" {
  description = "Security group ID for the internal ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALBs and target groups will be created"
  type        = string
}

variable "public_target_instance_ids" {
  description = "List of EC2 instance IDs for the public target group"
  type        = list(string)
}

variable "internal_target_instance_ids" {
  description = "List of EC2 instance IDs for the internal target group"
  type        = list(string)
}
