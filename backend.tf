terraform {
  backend "s3" {
    bucket        = "my-terraform-state-youssef123"
    key           = "dev/terraform.tfstate"
    region        = "us-east-1"
    use_lockfile  = true  # Replaces dynamodb_table
    encrypt       = true
  }
}

