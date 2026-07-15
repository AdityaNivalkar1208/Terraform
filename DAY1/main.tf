terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

provider "local" {}

provider "random" {}

resource "random_pet" "name" {
  length = 2
}

resource "local_file" "greeting" {
  filename = "greeting.txt"

  content = "Hello ${random_pet.name.id}"
}