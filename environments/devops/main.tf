module "gke" {
    source = "../../modules/gke-cluster"
    gcp_project_id = var.gcp_project_id
    gcp_region = var.gcp_region
    gcp_zone = var.gcp_zone
    gke_name = "gke-cluster"
    gke_network = var.gke_network
    gke_subnetwork = var.gke_subnetwork
    gke_ip_range_pods = var.gke_ip_range_pods
    gke_ip_range_services = var.gke_ip_range_services
    gke_name_pod = var.gke_name_pod
}