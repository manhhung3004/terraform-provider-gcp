########################## server-cluster1 module ##########################
module "vpc" {
  source         = "../../modules/vpc"
  vpc_name       = "dev-vpc"
  region         = "asia-east1"
  subnet_a_name  = "subnet-a"
  subnet_a_cidr  = "10.0.1.0/24"
  subnet_b_name  = "subnet-b"
  subnet_b_cidr  = "10.0.2.0/24"
}

module "loadbalancer" {
  source               = "../../modules/loadbalancer"
  loadbalancer_name    = "dev-load-balancer"
  backend_service_name = "dev-backend-service"
  port_name            = "http"
  protocol             = "HTTP"
  health_check         = "https://www.googleapis.com/compute/v1/projects/${var.gcp_project_id}/global/healthChecks/dev-health-check"
}

module "cloud-nat" {
  source       = "../../modules/cloud-nat"
  router_name  = "dev-router"
  nat_name     = "dev-nat"
  network      = module.vpc.vpc_name
  region       = "asia-east1"
  enable_logging = true
}

### server module #####
module "compute" {
  source               = "../../modules/compute"
  instance_count       = 1
  instance_name_prefix = "dev-server"
  instance_type        = var.instance_type
  image                = var.gcp_image
  network              = module.vpc.vpc_name
  subnetwork           = module.vpc.subnet_b_id
  zone                 = var.gcp_zone
  ssh_public_key       = file("../keypem/id_rsa.pub")
}

#### storage module #####
module "storage" {
  source      = "../../modules/storage"
  location    = var.gcp_region
  labels = {
    environment = "dev"
  }
  disk_name = "dev-disk"
  zone      = var.gcp_zone
  size      = 20
  disk_type = "pd-standard"
}

######## # GKE CLUSTER MODULE #########

# module "gke-cluster" {
#   source        = "../../modules/gke-cluster"
#   location     = var.gcp_region
#   project       = var.gcp_project_id
#   name          = var.cluster_name
#   network       = module.vpc.vpc_name
#   subnetwork    = module.vpc.subnet_a_id
# }

# resource "google_container_node_pool" "node_pool" {
#   name     = "private-pool"
#   project  = var.gcp_project_id
#   location = var.gcp_region
#   cluster  = module.gke-cluster.cluster_name

#   initial_node_count = 1

#   autoscaling {
#     min_node_count = 1
#     max_node_count = 3
#   }

#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }

#   node_config {
#     image_type   = "COS_CONTAINERD"
#     machine_type = "e2-standard-2"

#     labels = {
#       private-pools-example = "true"
#     }

#     tags = [
#       "private-pool-example",
#     ]

#     # disk_size_gb = 20
#     # disk_type    = "pd-standard"
#     # preemptible  = false

#     # service_account = module.gke_service_account.email

#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform",
#     ]
#   }

#   lifecycle {
#     ignore_changes = [initial_node_count]
#   }

#   timeouts {  
#     create = "30m"
#     update = "30m"
#     delete = "30m"
#   }
# }
