# This file configures the Google Cloud provider for Terraform.
terraform {
  # cloud { 
    
  #   organization = "Strategies-deployment-gke" 

  #   workspaces { 
  #     name = "Strategies-deployment-gke" 
  #   } 
  # }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.43.0, < 7.0.0"
    }
  }
}

provider "google" {
  credentials = file("../server-cluster1-222379c0c7d8.json")
  # access_token = var.gcp-access-token
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}