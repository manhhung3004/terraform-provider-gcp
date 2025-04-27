# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gke_name
  region                     = var.gcp_region
  zones                      = var.gcp_zone
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = var.gke_ip_range_pods
  ip_range_services          = var.gke_ip_range_services
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  dns_cache                  = false

  node_pools = [
    {
      name                        = var.gke_name_pod
      machine_type                = "e2-standard-2"
      node_locations              = "us-central1-b,us-central1-c"
      min_count                   = 1
      max_count                   = 5
      local_ssd_count             = 0
      spot                        = true ## using spot instance
      disk_size_gb                = 100
      disk_type                   = "pd-standard"
      image_type                  = "COS_CONTAINERD"
      enable_gcfs                 = false
      enable_gvnic                = false
      logging_variant             = "DEFAULT"
      auto_repair                 = true
      auto_upgrade                = true
      service_account             = "project-service-account@${var.gcp_project_id}.iam.gserviceaccount.com"
      preemptible                 = false
      initial_node_count          = 80
      accelerator_count           = 1
      accelerator_type            = "nvidia-l4"
      gpu_driver_version          = "LATEST"
      gpu_sharing_strategy        = "TIME_SHARING"
      max_shared_clients_per_gpu = 2
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "gke-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}