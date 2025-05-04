# Terraform provider file

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=5.0.0"  # Specify the desired version
    }
  }

  # ---------------------------------------------------------------------------------------------------------------------
  # Provider Block
  # ----------------------------------------------------------------------------------------

}

provider "google" {
    project = var.project
    region  = "australia-southeast"
    zone    = "australia-southeast2"
  }
