variable "project_id" {
  type        = string
  description = "value of project_id"
}

variable "region" {
  type        = string
  description = "value of region"
}

variable "zone" {
  type        = string
  description = "value of zone"
}

variable "server_name" {
  type        = string
  default     = "prod-server"
  description = "value of server_name"
}

variable "env" {
  type        = string
  default     = "prod-env"
  description = "value of env"
}