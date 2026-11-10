terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Récupération de l'image
resource "docker_image" "nginx" {
  name = var.nginx_image
}

# Création du conteneur
resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.host_port
  }

  env = [
    "APP_ENV=${var.environment}"
  ]
}
