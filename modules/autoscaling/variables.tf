variable "instance_group_name" {
  description = "Name of the instance group"
  type        = string
}

variable "gcp_zone" {
  description = "GCP zone for the instance group"
  type        = string
}
variable "target_size" {
  description = "Target size of the instance group"
  type        = number
}
variable "base_instance_name" {
  description = "Base name for the instances in the group"
  type        = string
}