module "networking" {
  source = "./networking.tf"
}

module "ecs" {
  source = "./ecs.tf"
}

module "alb" {
  source = "./alb.tf"
}
