resource "google_compute_instance" "web" {
    // provider meta-argument used in resource block
    provider = google
    name = "webserver"

    machine_type = "e2-medium"

    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network = default
        access_config {
      
    }
  }
}

// provider meta-argument used separately
provider "google" {
  zone =  "us-east1-c"
}