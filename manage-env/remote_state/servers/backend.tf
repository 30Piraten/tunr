terraform {
    backend "gcs" {
        bucket = "gcterraform-tf-state"
        prefix = "server/state/backend"
    }
}