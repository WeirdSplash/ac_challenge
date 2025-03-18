terraform {
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket         = "mi-bucket-terraform-state2"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

module "networking" {
  source = "./networking"
}

module "ecs" {
  source = "./ecs"
  vpc_id = module.networking.vpc_id
  subnets = module.networking.subnets
}

module "alb" {
  source = "./alb"
  vpc_id = module.networking.vpc_id
  subnets = module.networking.subnets
  ecs_service_name = module.ecs.service_name
}
