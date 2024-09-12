resource "random_string" "suffix" {
    length = 3
    special = false
    upper = true 
}

resource "google_sql_database_instance" "db" {
    name = "db-${random_string.suffix.result}"
    database_version = "POSTGRES_15"
    region = var.region
    settings {
        tier = "db-f1-micro"
    }
}