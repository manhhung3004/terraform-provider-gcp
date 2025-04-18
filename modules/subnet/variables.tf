variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_description" {
  description = "A description of the subnet"
  type        = string
}

variable "region" {
  description = "The region where the subnet will be deployed"
  type        = string
}

variable "network" {
  description = "The network where the subnet will be deployed"
  type        = string
}

variable "ip_cidr_range" {
  description = "The CIDR range for the subnet"
  type        = string
}