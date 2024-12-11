terraform {
  backend "s3" {
    bucket  = "myarchitecturebucket2024-1"
    key     = "terraform/state.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
