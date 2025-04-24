locals {
  common_region = "us-west1"

  subnets = [
    {
      subnet_name           = "public-subnet-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = local.common_region
      subnet_private_access = false
      tags                  = ["public"]
      subnet_flow_logs      = true
      description           = "This is a public subnet 1 with a description"
    },
    {
      subnet_name           = "public-subnet-02"
      subnet_ip             = "10.10.20.0/24"
      tags                  = ["public"]
      subnet_region         = local.common_region
      subnet_private_access = false
      subnet_flow_logs      = true
      description           = "This is a public subnet 2 with a description"
    },
    {
      subnet_name               = "private-subnet-01"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = local.common_region
      subnet_private_access     = true
      subnet_flow_logs          = true
      tags                      = ["private"]
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    },
    {
      subnet_name               = "private-subnet-02"
      subnet_ip                 = "10.10.40.0/24"
      subnet_region             = local.common_region
      subnet_private_access     = true
      tags                      = ["private"]
      subnet_flow_logs          = true
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "This is a private subnet 2 with a description"
    }
  ]
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 10.0"

  project_id   = var.gcp_project_id
  network_name = "vpc-hungnm-test"

  subnets = local.subnets

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
}

resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  region  = local.common_region
  project = var.gcp_project_id
  network = module.vpc.network_name
}

resource "google_compute_router_nat" "nat" {
  provider = google-beta
  name     = "nat-router-config"
  router   = google_compute_router.nat_router.name
  region   = local.common_region
  project  = var.gcp_project_id

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  dynamic "subnetwork" {
    for_each = [for s in local.subnets : s if contains(s.tags, "private")]
    content {
      name                    = subnetwork.value.subnet_name
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }
}

resource "google_compute_firewall" "allow_egress_public" {
  name    = "allow-egress-public"
  network = module.vpc.network_name
  project = var.gcp_project_id

  direction = "EGRESS"
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  destination_ranges = ["0.0.0.0/0"]
  target_tags        = ["public"]
}

resource "google_compute_firewall" "allow_egress_private" {
  name    = "allow-egress-private"
  network = module.vpc.network_name
  project = var.gcp_project_id

  direction = "EGRESS"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  destination_ranges = ["0.0.0.0/0"]
  target_tags        = ["private"]
}

resource "google_compute_firewall" "allow_ingress_ssh" {
  name    = "allow-ingress-ssh"
  network = module.vpc.network_name
  project = var.gcp_project_id

  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["172.16.7.14/32"] # Thay bằng IP của bạn
  target_tags   = ["public"]
}