module "server1" {
  source       = "../modules/server"
  name         = "${var.server_name}-1"
  machine_size = "small"
  env          = var.env
}

module "server2" {
  source       = "../modules/server"
  name         = "${var.server_name}-2"
  machine_size = "small"
  env          = var.env
}