variable "project_id" {
  type = string
  description = "self_link project_id"
}

variable "region" {
  type = string
  description = "self_link region"
}

variable "zone" {
  type = string
  description = "self_link zone"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
  description = "self_link machine_type"
}