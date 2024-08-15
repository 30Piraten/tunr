resource "google_compute_instance" "name" {
  project = var.project_id
  name    = var.network
  zone    = var.zone

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

resource "google_compute_network" "net" {
  name                    = "vpcnet"
  project                 = var.project_id
  auto_create_subnetworks = false
  description             = "A custom network for VPC!"
}

resource "google_compute_subnetwork" "name" {
  // The depends_on is an escape hatch, 
  // better to use/apply this to network, instead.
  // using the network = resource..., achieves the
  // same result as the depends_on, and also makes the
  // dependency explicit

  # depends_on = [resource.google_compute_network.net]
  project    = var.project_id
  for_each   = var.subnets
  network                  = resource.google_compute_network.net.name
  name                     = each.key
  region                   = each.value["region"]
  ip_cidr_range            = each.value["ip_cidr_range"]
  private_ip_google_access = "true"
}
 
