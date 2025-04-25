# This file configures the Google Cloud provider for Terraform.
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.43.0, < 7.0.0"
    }
  }
}

provider "google" {
  credentials = file("../server-cluster1-222379c0c7d8.json")
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}

provider "google-beta" {
  credentials = file("../server-cluster1-222379c0c7d8.json")
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}