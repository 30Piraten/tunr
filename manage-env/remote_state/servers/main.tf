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
        access_config {
            // Ephemeral public IP
        }
    }

    metadata_startup_script = templatefile("startup.tftpl", {
        connection_name = data.terraform_remote_state.db.outputs.connection_name
    })

    tags = ["http-server"]
}

output "URL" {
    value = format("http://%s", google_compute_instance.vm.network_interface.0.access_config.0.nat_ip)
}