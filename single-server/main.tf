terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  # configuration here
  project = "<project ID here>"
  region  = "us-east1"
  zone    = "us-east1-c"
}

resource "google_compute_instance" "vm-instance" {
  name         = "single-server"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {

    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = true
}
