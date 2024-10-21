
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    shell = {
      source  = "scottwinkler/shell"
      version = ">= 1.7.10"
    }
  }
}

provider "shell" {
  sensitive_environment = {
    OAUTH_TOKEN = var.oauth_token
  }
}

resource "shell_script" "github_repository" {
  lifecycle_commands {
    create = file("${path.module}/scripts/create.sh")
    read   = file("${path.module}/scripts/read.sh")
    update = file("${path.module}/scripts/update.sh")
    delete = file("${path.module}/scripts/delete.sh")
  }

  environment = {
    NAME        = "HELLO-WORLD"
    DESCRIPTION = "description"
  }
}
