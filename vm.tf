resource "google_compute_instance" "test" {
  name         = "test-vm"
  machine_type = "e2-standard-2"
  zone         = "us-east1-b"

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
   service_account {
    # If email is omitted, the default Compute Engine service account is used
    email  = null 
    # Required to allow the SA to call Google APIs (like Secret Manager)
    scopes = ["cloud-platform"] 
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y ansible-core
  EOF

}
