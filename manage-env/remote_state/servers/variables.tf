variable "project_id" {
    type = string
    description = "value of project_id"
}

variable "region" {
  type = string 
  description = "value of region"
}

variable "zone" {
  type = string
  description = "value of zone"
}

variable "name" {
  type = string 
  default = "dev-vm"
  description = "value of name"
}

variable "machine_type" {
  type = string 
  default = "e2-medium"
  description = "value of machine_type"
}