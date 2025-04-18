variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
}
variable "api_gateway_description" {
  description = "A description of the API Gateway"
  type        = string
}
variable "region" {
  description = "The region where the API Gateway will be deployed"
  type        = string
  default     = "asia-east1"
}

variable "api_id" {
  description = "The ID of the API"
  type        = string
  default     = "api-id-1"
}
variable "api_name" {
  description = "The name of the API"
  type        = string
  default     = "api-gateway-1"
}
variable "api_type" {
  description = "The type of the API"
  type        = string
}
variable "backend_service_name" {
  description = "The name of the backend service"
  type        = string
  default     = "backend-service-1"
}
variable "backend_service_url" {
  description = "The URL of the backend service"
  type        = string
  default     = ""
}
variable "security_policy_name" {
  description = "The name of the security policy"
  type        = string
  default     = "security-policy-1"
}
variable "security_policy_url" {
  description = "The URL of the security policy"
  type        = string
  default     = ""
}
variable "api_gateway_labels" {
  description = "Labels to apply to the API Gateway"
  type        = map(string)
  default     = {}
}
variable "api_gateway_tags" {
  description = "Tags to apply to the API Gateway"
  type        = list(string)
  default     = []
}
variable "api_gateway_timeout" {
  description = "Timeout for the API Gateway"
  type        = string
  default     = "60s"
}
variable "api_gateway_retry_policy" {
  description = "Retry policy for the API Gateway"
  type        = map(string)
  default     = {}
}