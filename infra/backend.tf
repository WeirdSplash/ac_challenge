terraform {
  backend "s3" {
    bucket         = "mi-bucket-terraform-state2"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
