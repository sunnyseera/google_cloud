resource "google_compute_network" "udemy" {
    name = "udemy-network"
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "network" {
    name = "udemy-subnetwork"
    ip_cidr_range = "10.2.0.0/16"
    region = "us-central1"
    network = "${google_compute_network.udemy.self_link}"
}

resource "google_compute_subnetwork" "network1" {
    name = "udemy-subnetwork"
    ip_cidr_range = "10.3.0.0/16"
    region = "europe-west2"
    network = "${google_compute_network.udemy.self_link}"
}

resource "google_compute_subnetwork" "network2" {
    name = "udemy-subnetwork"
    ip_cidr_range = "10.4.0.0/16"
    region = "europe-west1"
    network = "${google_compute_network.udemy.self_link}"
}

resource "google_compute_subnetwork" "networ3" {
    name = "udemy-subnetwork"
    ip_cidr_range = "10.5.0.0/16"
    region = "europe-west4"
    network = "${google_compute_network.udemy.self_link}"
}
