resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  project = "devops-ss-sandbox"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "sss-dmz-vpc"
    subnetwork = "sss-dmz-subnet"
    subnetwork_project = "devops-ss-sandbox"
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"
}