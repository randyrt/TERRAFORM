
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Télécharger l'image Nginx
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# Créer le conteneur Nginx
resource "docker_container" "nginx" {
  name  = "nginx-terraform"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  restart = "unless-stopped"
}

# Afficher l'adresse du serveur
output "nginx_url" {
  value = "http://localhost:8080"
}
