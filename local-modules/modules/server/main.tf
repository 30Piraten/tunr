// static IP address config. 
// returns an address if static_ip is true
// none if static_ip is false
resource "google_compute_address" "static_address" {
  count = var.static_ip ? 1 : 0
  name = "${var.name}-ipv4-address"
}

// server definition via compute instance
// the config for the static_ip is passed
// in the access_config block via a dynamic
// block. 
resource "google_compute_instance" "vm" {
  name = var.name
  zone = var.zone
  machine_type = var.machine_type

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

  // the path.module variable is used here to 
  // return the file system path where the module is located
  metadata_startup_script = file("${path.module}/startup-script.sh")
  tags = ["http-server"]
}