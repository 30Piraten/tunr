terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.0.0"
    }
  }
}

resource "google_compute_instance" "vm" {
  name = "vm1"
  zone = var.zone

  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.net.name
    access_config {
      // ephemeral link
    }
  }
}

resource "google_compute_network" "net" {
  name = "net2"
  project = var.project_id
  auto_create_subnetworks = true
  description = "Simple self_link network"
}