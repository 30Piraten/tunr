variable "name" {
  type        = string
  description = "value of name"
}

variable "zone" {
  type        = string
  default     = "us-east1-b"
  description = "value of zone"
}

variable "static_ip" {
  type        = bool
  default     = true
  description = "value of static_ip"
}

variable "env" {
  type        = string
  default     = "dev-env"
  description = "value of env"
}

variable "machine_size" {
  type    = string
  default = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.machine_size)
    error_message = "The value must be small, medium or large."
  }
}