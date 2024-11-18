terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

# Configuring a backend to store our state files in s3 and a LockID to ensure only one user can "execute to the dynamodb table at a time"

terraform {
  backend "s3" {
    bucket         = "rene-terraform-backend-s3"
    key            = "terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "rene-terraform-backend-dynamodb"
    encrypt        = false
  }
}