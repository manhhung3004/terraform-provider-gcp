variable "gcp_project_id" {
  description = "ID của project GCP"
  type        = string
  default     = "server-cluster1"
}

variable "gcp_region" {
  description = "Region GCP"
  type        = string
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "Zone GCP"
  type        = string
  default     = "us-central1"
}

variable "gke_name" {
  description = "Tên của GKE cluster"
  type        = string
}

variable "gke_network" {
  description = "name VPC network"
  type        = string
}

variable "gke_subnetwork" {
  description = "name VPC subnetwork"
  type        = string
}
variable "gke_ip_range_pods" {
  description = "name VPC ip range pods"
  type        = string
}
variable "gke_ip_range_services" {
  description = "name VPC ip range services"
  type        = string
}

variable "gke_name_pod" {
  description = "Tên của GKE node pool"
  type        = string
}

# variable "gcp-access-token" {
#   description = "GCP access token"
#   type        = string
# }