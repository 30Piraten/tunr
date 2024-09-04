data "google_compute_zones" "zn" {
}

resource "google_compute_instance" "vm" {
  count = 3

  name = var.server_name
  zone = data.google_compute_zones.zn.names[count.index % length(data.google_compute_zones.zn.names)]

  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}

output "zones" {
  value = [for s in google_compute_instance.vm[*] : "${s.name}: ${s.zone}"]
}