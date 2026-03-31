provider "google" {
  project = "winged-ratio-491912-c4" 
  # Replace with your actual ID
  region  = "us-east1"
  zone    = "us-east1-b"
  impersonate_service_account = "terraform-sa@winged-ratio-491912-c4.iam.gserviceaccount.com"
}

