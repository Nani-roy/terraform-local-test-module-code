terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}
provider "local" {
}
provider "aws" {
  region = "ap-south-1"
  shared_credentials_file = "/Users/mnroy/.aws/credentials"
}


