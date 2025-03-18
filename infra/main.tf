terraform {
  required_version = ">= 1.3.0"
}

module "networking" {
  source = "./"
}

module "ecs" {
  source = "./"
}

module "alb" {
  source = "./"
}
