terraform {
    backend "gcs" {
        bucket = "udemy-test-remotestate-gcp"
        prefix = "terraform/terrraform.tfstate"
        credentials = "secrets.json"
    }
}