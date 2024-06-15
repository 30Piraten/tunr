terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  project = "praxis-magnet-419906"
  region  = "us-east1"
  zone    = "us-east1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "web-server"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {

    }
  }

  # adhoc script for simple flask server
  # connect to vm_instance and access the created folder
  # or simple run with vm_external_ip:{port}
  # --> 33....:9000
  metadata_startup_script = <<-EOF
  #! /bin/bash
  sudo apt-get update
  sudo apt-get install -y python3-pip
  sudo pip3 install flask gunicorn

  # Create the Flask App
  mkdir -p /home/flaskapp
  cat <<'EOFPYTHON' > /home/flaskapp/server.py
  ${file("server.py")}
  EOFPYTHON

  # Run the Flask App with Gunicorn
  nohup gunicorn --chdir /home/flaskapp server:app -b 0.0.0.0:9000 &
  EOF

  tags = ["http-server"]
}

resource "google_compute_network" "vpc_network" {
  name                    = "network"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.self_link

  # access to this port will be defined as follows
  # VM_EXTERNAL_IP:9000 
  allow {
    protocol = "tcp"
    # ports to allow http firewall
    ports = ["22", "80", "9000"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
