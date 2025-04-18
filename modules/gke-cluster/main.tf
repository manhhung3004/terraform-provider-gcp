# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A GKE CLUSTER
# This module deploys a GKE cluster, a managed, production-ready environment for deploying containerized applications.

resource "google_container_cluster" "cluster" {
  name        = var.name
  description = var.description

  project    = var.project
  location   = var.location
  network    = var.network
  subnetwork = var.subnetwork

  logging_service    = var.logging_service
  monitoring_service = var.monitoring_service
  min_master_version = local.kubernetes_version

  enable_legacy_abac = false # Disable legacy ABAC for security

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_endpoint = var.disable_public_endpoint
    enable_private_nodes    = var.enable_private_nodes
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  addons_config {
    http_load_balancing {
      disabled = !var.http_load_balancing
    }

    horizontal_pod_autoscaling {
      disabled = !var.horizontal_pod_autoscaling
    }

    network_policy_config {
      disabled = !var.enable_network_policy
    }
  }

  network_policy {
    enabled  = var.enable_network_policy
    provider = var.enable_network_policy ? "CALICO" : "PROVIDER_UNSPECIFIED"
  }

  vertical_pod_autoscaling {
    enabled = var.enable_vertical_pod_autoscaling
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = var.maintenance_start_time
    }
  }

  lifecycle {
    ignore_changes = [
      node_config,
    ]
  }

  resource_labels = var.resource_labels
}

# ---------------------------------------------------------------------------------------------------------------------
# Prepare locals to keep the code cleaner
# ---------------------------------------------------------------------------------------------------------------------

locals {
  latest_version     = data.google_container_engine_versions.location.latest_master_version
  kubernetes_version = var.kubernetes_version != "latest" ? var.kubernetes_version : local.latest_version
  network_project    = var.network_project != "" ? var.network_project : var.project
}

# ---------------------------------------------------------------------------------------------------------------------
# Pull in data
# ---------------------------------------------------------------------------------------------------------------------

data "google_container_engine_versions" "location" {
  location = var.region
  project  = var.project
}