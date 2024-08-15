resource "google_compute_disk" "dsk" {
  for_each = var.disks
  name     = each.key
  type     = each.value["type"]
  size     = each.value["size"]
  zone     = var.zone
}