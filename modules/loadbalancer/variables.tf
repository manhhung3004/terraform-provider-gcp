variable "loadbalancer_name" {
  description = "Tên Load Balancer"
  type        = string
}

variable "backend_service_name" {
  description = "Tên Backend Service"
  type        = string
}

variable "port_name" {
  description = "Tên cổng dịch vụ"
  type        = string
}

variable "protocol" {
  description = "Giao thức của dịch vụ"
  type        = string
}

variable "health_check" {
  description = "URL của Health Check"
  type        = string
}
