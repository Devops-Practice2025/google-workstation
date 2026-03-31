resource "google_compute_instance" "test" {
  name         = "test-vm"
  machine_type = "e2-medium"
  zone         = "us-east1-a"

  boot_disk {
    initialize_params {
      # Use rhel-9 for the latest version
      image = "rhel-cloud/rhel-9" 
      size  = 50
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.app_subnet.id
    access_config {
      # Gives the VM a public IP
    }
  }
}
