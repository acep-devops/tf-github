terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
  required_version = ">= 1.0.0"

  backend "gcs" {
    bucket = "acep_tf_statefile_manager"
    prefix = "terraform/github-statefile"
  }
}

provider "github" {
  owner = "acep-devops"
}