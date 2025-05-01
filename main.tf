
# ---------------------------------------------------------------------------------------------------------------------
# LOCAL VALUE
# ---------------------------------------------------------------------------------------------------------------------


locals {
  service = [
    "sourcerepo.googleapis.com",
    "cloudbuild.googleapis.com",
    "storage.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
  ]
}

# ---------------------------------------------------------------------------------------------------------------------
# ENABLED THE API SERVICE
# ---------------------------------------------------------------------------------------------------------------------

resource "google_project_service" "enabled_service" {
  for_each = toset(local.service)
  project  = var.project
  service  = each.key
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A GOOGLE CLOUD SOURCE REPOSITORY
# ---------------------------------------------------------------------------------------------------------------------

resource "google_sourcerepo_repository" "repo" {
  name = var.repository_name
  depends_on = [google_project_service.enabled_service["sourcerepo.googleapis.com"]]
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLOUD BUILD TRIGGER
# ---------------------------------------------------------------------------------------------------------------------

resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  description = "Cloud Source Repository Trigger ${var.repository_name} (${var.branch_name})"

  trigger_template {
    branch_name = var.branch_name
    repo_name   = var.repository_name
  }

  substitutions = {
    _LOCATION   = var.location
    _GCR_REGION = var.gcr_region
  }

  filename = "cloudbuild.yaml"
  included_files = [
    "*"
  ]

  depends_on = [google_sourcerepo_repository.repo]
}

# ---------------------------------------------------------------------------------------------------------------------
# GOOGLE CLOUD STORAGE BUCKET
# ---------------------------------------------------------------------------------------------------------------------

resource "google_storage_bucket" "gcp_bucket" {
  location      = "australia-southeast2"
  name          = "poc-bucket"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  uniform_bucket_level_access {
    enabled = true
  }

  # Optional: Set lifecycle rules
  lifecycle_rule {
    action {
      type = "Delete"
    }
  condition {
    age = 365 # Delete objects older than 365 days
  }
  }

}


