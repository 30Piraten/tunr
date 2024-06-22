resource "google_compute_instance" "vm-instance" {
  name         = "vm1"
  machine_type = "e2-medium"

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
}
