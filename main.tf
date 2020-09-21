provider "google" {
  project = "snaqvi"
  region = "us-central1"
  zone = "us-central1-c"
}
resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "sunil-flow-agent-image"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network = default
    #network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}
#resource "google_compute_network" "vpc_network" {
#  name = "terraform-network"
#  auto_create_subnetworks = "true"
#}

# gcloud compute instances list|grep terraform-instance|awk '{print $3}'
