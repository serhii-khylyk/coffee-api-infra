terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token # or `GITHUB_TOKEN`
}