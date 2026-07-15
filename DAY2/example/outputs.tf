output "container_name" {

  value = docker_container.web.name

}

output "access_url" {

  value = format("http://localhost:%d", var.external_port)

}

output "image" {

  value = docker_image.nginx.name

}

output "uppercase_names" {

  value = local.uppercase_names

}

output "instance_size" {

  value = local.instance_size

}

output "person" {

  value = var.person

}