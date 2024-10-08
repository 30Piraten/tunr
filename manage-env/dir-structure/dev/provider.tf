terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0.0"
    }
  }
}

provider "google" {
  region  = var.region
  zone    = var.zone
  project = var.project_id
}