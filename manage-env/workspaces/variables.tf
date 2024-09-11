variable "project_id" {
  type        = string
  description = "value of project_id"
}

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
  description = "value of server_name"
}

variable "env" {
  type        = string
  default     = "dev-env"
  description = "value of env"
}

variable "machine_type" {
  type        = string
  description = "value of machine_type"
}

variable "static_ip" {
  type        = bool
  default = true
  description = "value of static_ip"
}