output "public_ip_address" {
    value = var.static_ip ? google_compute_instance.vm.network_interface.0.access_config.0.nat_ip : null 
}

output "private_ip" {
    value = google_compute_instance.vm.network_interface.0.network_ip
}

output "self_link" {
    value = google_compute_instance.vm.self_link
}