module "server1" {
  source = "./modules/server"
  name   = "${var.server_name}-1"
  env    = var.env
}

module "server2" {
  source       = "./modules/server"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_size = "medium"
  env          = var.env
}

module "server3" {
  source       = "./modules/server"
  name         = "${var.server_name}-3"
  zone         = "us-east1-c"
  machine_size = "large"
  static_ip    = true
  env          = var.env
}