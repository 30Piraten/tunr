variable "zone" {
  type        = string
  description = " value of zone"
}

variable "project_id" {
  type        = string
  description = "project id"
}

variable "machine_type" {
  type        = string
  description = "value of machine_type"
}

variable "server_name" {
  type        = string
  description = "value of server_name"
}

variable "disks" {
  type = map(object({
    small-disk  = string
    medium-disk = string
    large-disk  = string
  }))
  description = "value of disks"
}