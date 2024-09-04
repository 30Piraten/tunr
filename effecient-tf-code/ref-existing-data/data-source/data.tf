data "google_compute_instance" "name" {
  name = "blog-db"
}

output "ip-address" {
  value = ("IP address: ${data.google_compute_instance.name.network_interface.0.access_config.0.nat_ip}")
}