terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0.0"
    }
  }
}

resource "google_compute_instance" "name" {
  name         = var.server_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Using Dynamic Blocks
  dynamic "attached_disk" {
    for_each = var.disks
    content {
      source = google_compute_disk.dsk[attached_disk.key].name
      mode   = attached_disk.value["mode"]
    }
  }

#   attached_disk {
#     source = google_compute_disk.dsk["small-disk"].name
#     mode   = var.disks["small-disk"]["mode"]
#   }
#   attached_disk {
#     source = google_compute_disk.dsk["medium-disk"].name
#     mode   = var.disks["medium-disk"]["mode"]
#   }
#   attached_disk {
#     source = google_compute_disk.dsk["large-disk"].name
#     mode   = var.disks["large-disk"]["mode"]
#   }

  network_interface {
    network = "default"
    access_config {}
  }
}