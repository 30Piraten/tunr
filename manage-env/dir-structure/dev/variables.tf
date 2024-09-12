variable "region" {
  type        = string
  default     = "us-east1"
  description = "value of region"
}

variable "zone" {
  type        = string
  default     = "us-east1-b"
  description = "value of zone"
}

variable "server_name" {
  type        = string
  default     = "dev-server"
  description = "value of server_name"
}

variable "env" {
  type        = string
  default     = "dev-env"
  description = "value of env"
}

variable "project_id" {
  type        = string
  description = "value of project_id"
}