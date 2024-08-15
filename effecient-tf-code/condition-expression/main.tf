resource "google_compute_address" "static_addr" {
  count = var.static_ip ? 1 : 0
  name = "ipv4-address"
}

resource "google_compute_instance" "vm1" {
  name = var.server_name
  machine_type = var.machine_type
  zone =  "us-east1-c"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = var.static_ip ? google_compute_address.static_addr[0].address : null
    }
  }
}