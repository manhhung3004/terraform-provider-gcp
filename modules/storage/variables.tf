variable "location" {
  description = "The location of the storage bucket"
  type        = string
}

variable "labels" {
  description = "Labels to apply to the storage bucket and disk"
  type        = map(string)
  default     = {}
}

variable "disk_name" {
  description = "The name of the compute disk"
  default     = "compute-disk-1"
  type        = string
}

variable "zone" {
  description = "The zone where the compute disk will be created"
  type        = string
}

variable "size" {
  description = "The size of the compute disk in GB"
  type        = number
}

variable "disk_type" {
  description = "The type of the compute disk (e.g., pd-standard, pd-ssd)"
  type        = string
}