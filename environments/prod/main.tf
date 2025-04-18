variable "project" {
  description = "The project ID to deploy resources"
  default     = "server-cluster1"
}

variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

module "network" {
  source = "../../modules/network"

  project = var.project
  region  = var.region
}

module "compute" {
  source = "../../modules/compute"

  project = var.project
  region  = var.region
}

module "storage" {
  source = "../../modules/storage"

  project = var.project
  region  = var.region
}