variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "region" {
  description = "The region for the network"
  type        = string
}

variable "subnet_a_name" {
  description = "The name of subnet A"
  type        = string
}

variable "subnet_a_cidr" {
  description = "CIDR for subnet A"
  type        = string
}

variable "subnet_b_name" {
  description = "The name of subnet B"
  type        = string
}

variable "subnet_b_cidr" {
  description = "CIDR for subnet B"
  type        = string
}
