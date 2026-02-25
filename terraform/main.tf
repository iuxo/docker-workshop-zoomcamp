terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.20.0"
    }
  }
}

provider "google" {
  # credentials = "./keys/my-creds.json"
  project     = "trusty-lock-488123-u7"
  region      = "us-central1"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "trusty-lock-488123-u7-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}