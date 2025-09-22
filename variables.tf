variable "key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
  default = "ansible-SSH"
}

variable "ssh_user" {
  description = "Default SSH user for EC2 instances"
  type        = string
  default     = "ubuntu" # Default for Ubuntu AMIs
}

variable "ssh_private_key_path" {
  description = "Path to your private SSH key file"
  type        = string
  default = "/home/youssef/.ssh/ansible-SSH.pem"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}
