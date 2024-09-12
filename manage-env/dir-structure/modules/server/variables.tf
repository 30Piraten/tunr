variable "zone" {
  type        = string
  default     = "us-east1-b"
  description = "value of zone"
}

variable "static_ip" {
  default     = true
  description = "value of static_ip"
}

variable "machine_size" {
  type = string 
  default = "small"
  validation {
    condition = contains(["small", "medium", "large"], var.machine_size)
    error_message = "value of machine_size must be small, medium or large"
  }
}

variable "name" {
  type        = string
  default     = "dev-vm"
  description = "value of name"
}

variable "env" {
  type        = string
  default     = "dev-env"
  description = "value of env"
}