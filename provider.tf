terraform {
 // cloud {
   // organization = "thebigdummycorp"
   // workspaces {
    //  name = "test-workspace"
   // }
 // }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("terraform-gcp.json")
  project     = var.project
  region      = var.region
}

