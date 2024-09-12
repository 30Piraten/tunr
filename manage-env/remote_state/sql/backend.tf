terraform {
    backend "gcs" {
        bucket = "gcterraform-tf-state"
        prefix = "db/state/backend"
    }
}