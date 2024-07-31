terraform {
  backend "gcs" {
    bucket = "gcterraform-tf-state"
    prefix = "state/backend"
  }
}