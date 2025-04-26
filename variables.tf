variable "repository_name"{
  description = "Name of the Google repo"
  type = string
  default = "cloudbuild-git"
}

variable "branch_name" {
  description = "Name of the branch within the repo"
  type = string
  default = "main"
}

variable "project" {
  description = "The project ID where all resources will be launched."
  type        = string
  default     = "cs-poc-cy5ns7qupwjtoxaijgpngro"
}

variable "location" {
  description = "Location of the project - region or zone."
  type        = string
}

variable "gcr_region" {
  description = "Detail of the gcr-region"
  type = string
}