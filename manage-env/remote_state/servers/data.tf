// gets imformation from sql backend
// and maps it to the compute instance [server]
data "terraform_remote_state" "db" {
    backend = "gcs"
    config = {
        bucket = "gcterraform-tf-state"
        prefix = "db/state/backend"
    }
}