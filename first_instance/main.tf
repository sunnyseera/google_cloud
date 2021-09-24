
resource "google_compute_instance" "default" {
count = "1"
name = "list-${count.index+1}"
machine_type = "${var.environment != "dev" ? var.machine_type : var.machine_type_dev}"
zone = "europe-west2-a"

boot_disk {
    initialize_params {
        image = "${var.image}"
    }
 }

network_interface {
    network = "default"
 }

service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
 }
  
}

output "machine_type" { value = "${google_compute_instance.default.*.machine_type}" }
output "name" { value = "${google_compute_instance.default.*.name}" }
output "zone" { value = "${google_compute_instance.default.*.zone}" }

#output "instance_id" { value = "${join(",",google_compute_instance.default.*.id)}"}