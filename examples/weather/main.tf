
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    shell = {
      source  = "scottwinkler/shell"
      version = ">= 1.7.10"
    }
  }
}

# runs the "whoami" command and returns user
data "shell_script" "user" {
  lifecycle_commands {
    read = <<-EOF
            echo "{\"user\": \"$(whoami)\"}"
        EOF
  }
}

# gets the weather as a data source
data "shell_script" "weather" {
  lifecycle_commands {
    read = <<-EOF
        echo "{\"SanFrancisco\": \"$(curl wttr.in/SanFrancisco?format="%l:+%c+%t")\"}"
    EOF
  }
}

# gets the weather as a resource
resource "shell_script" "weather" {
  lifecycle_commands {
    create = <<-EOF
            echo "{\"London\": \"$(curl wttr.in/London?format="%l:+%c+%t")\"}"  > state.json
            cat state.json
        EOF
    delete = "rm state.json"
  }
}
