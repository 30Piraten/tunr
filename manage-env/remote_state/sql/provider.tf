terraform {
    required_providers {
        google = {
            version = "~> 5.0.0"
            source = "hashicorp/google"
        }
    }
}

provider "google" {
    project =  var.project_id
    region = var.region
    zone = var.zone
}