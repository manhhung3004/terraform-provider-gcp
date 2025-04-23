locals {
  project = "terraform-series"
}

module "networking" {
  source = "./modules/networking"
}

module "database" {
  source = "./modules/database"
}

module "autoscaling" {
  source = "./modules/autoscaling"
}