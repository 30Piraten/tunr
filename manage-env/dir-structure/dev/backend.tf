terraform {
  backend "gcs" {
    bucket = "gcterraform-tf-state"
    prefix = "state/dev/backend"
  }
}