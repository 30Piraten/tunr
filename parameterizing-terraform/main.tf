terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}
resource "google_compute_instance" "server" {
  name         = var.server_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_firewall.default.network.self_link
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = file("server.sh")
  tags                    = ["http-server"]

}

resource "google_compute_firewall" "default" {
  name    = "default-allow-http"
  network = default
}
