terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0.0"
    }
  }
}

resource "google_compute_instance" "vm" {
  name = "vm1"
  zone = var.zone

  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # network = 
    network = google_compute_network.net.name
    access_config {
      // ephemeral link
    }
  }

  tags = ["http-server"]
  // lifecycle block declaration
    lifecycle {
      ignore_changes = [  
          labels,
       ]
    }
}

resource "google_compute_network" "net" {
  name                    = "net2"
  project                 = var.project_id
  auto_create_subnetworks = true
  description             = "Simple lifecycle test network"
}