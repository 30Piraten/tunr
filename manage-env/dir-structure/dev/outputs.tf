output "server1_public_ip_address" {
  value = module.server1.public_ip_address
}

output "server1_private_ip_address" {
  value = module.server2.private_ip_address
}

output "server2_public_ip_address" {
  value = module.server2.public_ip_address
}

output "server2_private_ip_address" {
  value = module.server2.private_ip_address
}