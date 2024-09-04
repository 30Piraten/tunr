locals {
    machine_type_mapping = {
        small = "e2-micro"
        medium = "e2-medium"
        large = "n2-standard-2"
    }
    machine_type = local.machine_type_mapping[var.machine_size]
}

resource "google_compute_address" "static_address" {
    count = var.static_ip ? 1 : 0
    name = "${var.name}-ipv4-address"
}

resource "google_compute_instance" "vm" {
  name = var.name
  zone = var.zone
  machine_type = local.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    dynamic "access_config" {
        for_each = google_compute_address.static_address
        content {
            nat_ip = access_config.value["address"]
        }
    }
  }
}