resource "google_compute_network" "custom_vpc" {
  name                    = "test-vpc"
  auto_create_subnetworks = false # Enables Custom Mode
}

resource "google_compute_subnetwork" "app_subnet" {
  name          = "app-subnet-us-east1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.custom_vpc.id
}
resource "google_compute_firewall" "allow_rule" {
  name    = "allow-rule"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
    allow {
      protocol = "tcp"
    ports    = ["443"]
  }
    allow {
      protocol = "tcp"
    ports    = ["80"]
    }
  source_ranges = ["0.0.0.0/0"] # For production, restrict this to your IP
}
