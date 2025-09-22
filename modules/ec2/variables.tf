variable "name" {
  description = "Prefix name for EC2 instances"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch instances into"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the instances"
  type        = list(string)
}

variable "ssh_user" {
  description = "SSH username for the AMI"
  type        = string
  default     = "ubuntu" # Default for Ubuntu AMIs
}

variable "ssh_private_key_path" {
  description = "Path to the private key file for SSH"
  type        = string
}
