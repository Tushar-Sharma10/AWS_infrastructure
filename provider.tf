# Required version of the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}

#Default provider
provider "aws" {
  region = "us-east-1"
}

# Provider can be used using the alias attribute
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}