terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}

provider "aws" {
  profile = var.iam_user
  region = var.aws_region
}

# --- variables ---

variable "iam_user" {
  default = "terraform-user"
}