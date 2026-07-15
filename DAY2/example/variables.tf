##############################
# Primitive Types
##############################

variable "container_name" {
  description = "Name of the Docker container."
  type        = string
  default     = "terraweek-web"
}

variable "external_port" {
  description = "Host port"

  type = number

  default = 8080

  validation {
    condition     = var.external_port > 1024 && var.external_port < 65535
    error_message = "Port must be between 1025 and 65534."
  }
}

variable "environment" {

  description = "Deployment environment"

  type = string

  default = "dev"

  validation {

    condition = contains(["dev", "staging", "prod"], var.environment)

    error_message = "Environment must be dev, staging or prod."

  }

}

variable "enable_logs" {

  type = bool

  default = true

}

##############################
# Collection Types
##############################

variable "names" {

  type = list(string)

  default = [
    "aditya",
    "terraform",
    "docker"
  ]

}

variable "extra_labels" {

  type = map(string)

  default = {

    team = "trainwithshubham"

  }

}

variable "skills" {

  type = set(string)

  default = [
    "Terraform",
    "Docker",
    "Git"
  ]

}

##############################
# Structural Types
##############################

variable "person" {

  type = object({

    name = string

    age = number

  })

  default = {

    name = "Aditya"

    age = 23

  }

}

variable "details" {

  type = tuple([
    string,
    number,
    bool
  ])

  default = [
    "Developer",
    23,
    true
  ]

}

##############################
# Sensitive Variable
##############################

variable "password" {

  type = string

  sensitive = true

  default = "Admin@123"

}

##############################

variable "image_tag" {

  type = string

  default = "1.27-alpine"

}