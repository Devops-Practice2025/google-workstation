provider "google" {
  project = "orbital-surge-491811-s1" 
  credentials = file("./token.json")# Replace with your actual ID
  region  = "us-east1"
  zone    = "us-east1-a"

}
