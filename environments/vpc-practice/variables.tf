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
