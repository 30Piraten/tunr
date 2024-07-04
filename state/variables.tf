variable "project_id" {
  type        = string
  description = "ID of the project in use"
}

variable "region" {
  type        = string
  description = "Region specified for the project in use"
  default     = "us-east1"
}

variable "zone" {
  type        = string
  description = "Zone specified for the project in use"
  default     = "us-east1-c"
}

variable "server_name" {
  type        = string
  description = "Name of the server for the instance"
}

variable "machine_type" {
  type        = string
  description = "The manchine type for the desired state"
  default     = "e2-medium"
}
