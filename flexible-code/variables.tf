variable "project_id" {
  type        = string
  description = "value of project"
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
  type = string
}