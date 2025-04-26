# Terraform provider file

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Provider Block
# ----------------------------------------------------------------------------------------

provider "google" {
  project     = var.project
  region      = "us-central1"
  zone        = "us-central1-a"
}