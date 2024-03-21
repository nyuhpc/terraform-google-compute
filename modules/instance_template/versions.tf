terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.90.1"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.90.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}
