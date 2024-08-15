terraform {
  required_version = "~> 1.8.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0.0"
    }
  }
}

resource "google_compute_instance" "statefile" {

  # provider = google
  count = 3
  name         = "${var.server_name} - ${count.index}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = file("startup-script.sh")
  tags                    = ["http-server"]
}
