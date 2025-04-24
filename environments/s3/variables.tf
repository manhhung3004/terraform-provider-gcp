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

variable "bucket_prefix" {
  description = "Prefix for GCS bucket names to ensure uniqueness"
  type        = string
  default     = "buckets-hungnm" # Thay đổi giá trị mặc định nếu cần
}