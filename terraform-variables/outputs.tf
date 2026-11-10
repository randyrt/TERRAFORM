output "container_name" {
  value = docker_container.nginx.name
}

output "nginx_url" {
  value = "http://localhost:${var.host_port}"
}

output "current_environment" {
  value = var.environment
}

