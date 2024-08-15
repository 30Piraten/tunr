variable "project_id" {
  type        = string
  description = "Name of GCP project id"
}

variable "zone" {
  type        = string
  default     = "us-east1-b"
  description = "Zone for VPC"
}

variable "network" {
  type        = string
  description = "Network name"
}

// Subnet variable declaration
variable "subnets" {
  type = map(object({
    region        = string
    ip_cidr_range = string
  }))
  description = "subnets definition"
}

// Firewall variable declaration
variable "firewall" {
  type = list(object({
    name      = string
    direction = string
    allow = object({
      protocol = string
      ports    = list(string)
    })
    source_ranges = list(string)
    target_tags   = list(string)
  }))
  description = "Firewall rules"
}