variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-east1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-east1-c"
}

variable "server_name" {
  type        = string
  description = "Name of the server"
}

variable "machine_type" {
  type        = string
  description = "The machine type"
  default     = "e2-medium"
}

