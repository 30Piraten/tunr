resource "google_compute_address" "static_addr" {
  count = var.static_ip ? 1 : 0
  name  = "ipv4-address"

  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "vm1" {
  name = var.server_name

  project = var.project_id
  zone    = var.zone

  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    # access_config {
    #   nat_ip = var.static_ip ? google_compute_address.static_addr[0].address : null
    # }
    // Using a dynamic block
    dynamic "access_config" {
      for_each = google_compute_address.static_addr
      content {
        nat_ip = access_config.value.address
      }
    }
  }
  tags = ["http-server"]
}