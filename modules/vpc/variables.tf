variable "name" {
  description = "Name prefix for all VPC resources"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}
