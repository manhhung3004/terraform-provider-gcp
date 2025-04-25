module "vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "36.2.0"

  name = "${var.project}-vpc"
  cidr = var.vpc_cidr

  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = true
  enable_nat_gateway           = true
  single_nat_gateway           = true
}

module "allow_http" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "6.1.0"

  project_id = var.project
  network    = module.vpc.network_name

  rules = [
    {
      name        = "allow-http"
      description = "Allow HTTP traffic from any source"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["80"]
        }
      ]
    }
  ]
}

module "allow_http_web_sg" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "6.1.0"

  project_id = var.project
  network    = module.vpc.network_name

  rules = [
    {
      name        = "allow-http-web-sg"
      description = "Allow HTTP traffic on port 80 for web_sg"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"]
      target_tags = ["web_sg"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["80"]
        }
      ]
    }
  ]
}

module "allow_db_sg" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "6.1.0"

  project_id = var.project
  network    = module.vpc.network_name

  rules = [
    {
      name        = "allow-db-sg"
      description = "Allow database traffic on port 5432 for db_sg"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"]
      target_tags = ["db_sg"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["5432"]
        }
      ]
    }
  ]
}