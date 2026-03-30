resource "google_compute_instance" "test" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      # Use rhel-9 for the latest version
      image = "rhel-cloud/rhel-9" 
      size  = 50
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Gives the VM a public IP
    }
  }
}
