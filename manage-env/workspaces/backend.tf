terraform {
  backend "gcs" {
    bucket = "gcterraform-tf-state"
    prefix = "workspaces/state/backend"
  }
}