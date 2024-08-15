resource "google_compute_instance" "name" {
  provider =  google
  // count meta-argument used here to denote
  // the number of web servers needed for this
  // application.
  count = 3
  name = "webserver - ${count.index}"

  machine_type = "e2-medium"
  zone =  "us-east1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = default
    access_config {
      // ephemeral IP
    }
  }
  tags = ["http-server"]
}