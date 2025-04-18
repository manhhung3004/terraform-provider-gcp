variable "instance_count" {
  description = "Số lượng máy ảo cần tạo"
  type        = number
  default     = 1
}

variable "instance_name_prefix" {
  description = "Tiền tố cho tên máy ảo"
  type        = string
  default     = "vm"
}

variable "instance_type" {
  description = "Loại máy ảo (instance type)"
  type        = string
  default     = "f1-micro"
}

variable "image" {
  description = "Image GCP"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "subnetwork" {
  description = "ID của subnetwork"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "metadata" {
  description = "Metadata cho máy ảo"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags cho máy ảo"
  type        = list(string)
  default     = []
}

variable "ssh_public_key" {
  description = "SSH public key cho máy ảo"
  type        = string
}

variable "boot_disk_size" {
  description = "Kích thước boot disk (GB)"
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "Loại boot disk"
  type        = string
  default     = "pd-standard"
}

variable "service_account_email" {
  description = "Email của service account"
  type        = string
  default     = null
}

variable "service_account_scopes" {
  description = "Danh sách scopes cho service account"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "enable_secure_boot" {
  description = "Bật Secure Boot"
  type        = bool
  default     = false
}

variable "enable_vtpm" {
  description = "Bật vTPM"
  type        = bool
  default     = false
}

variable "enable_integrity_monitoring" {
  description = "Bật Integrity Monitoring"
  type        = bool
  default     = false
}

variable "network" {
  description = "Tên của network"
  type        = string
}