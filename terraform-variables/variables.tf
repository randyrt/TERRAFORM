variable "container_name" {
  description = "Nom du conteneur Docker"
  type        = string
  default     = "nginx-terraform"
}

variable "nginx_image" {
  description = "Image Docker de Nginx"
  type        = string
  default     = "nginx:alpine"
}

variable "host_port" {
  description = "Port HTTP expose sur la machine locale"
  type        = number
  default     = 8081
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "development"
}
