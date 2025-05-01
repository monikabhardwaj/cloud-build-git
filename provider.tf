# Terraform provider file

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Provider Block
# ----------------------------------------------------------------------------------------

provider "google" {
  project     = var.project
  region      = "australia-southeast"
  zone        = "australia-southeast2"
}