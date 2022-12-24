variable "environment" {
  type        = string
  description = "The environment of azure resources"
  default     = "dev"
}
variable "tags" {
  description = "Tags that should be applied to resources created by this module. Runtime tag values will take precedent over compile time values"
  type        = map(string)
  default     = {}
}
variable "ssh_public_key" {
  type        = string
  description = "The SSH public key to use for the cluster nodes"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdgESgBa92Xt8OPWCfNT5qB1/y+fULtIDhYdMUcgjhuCOg3COjZy1EbkFUas/zcgUn60meh3bjTSlSxwaAkB6+x7GvgjPj/W9UemZTcgb6Nc7QP3JLCN45Tr4yGwrrZxmcVBuB2+RR/qjKc8SaJvUxFQem4Q5zD+Z1WSeP3v/SQ6XlgUo23CYCDbRx8sSQ5HExXBkJ07rN4GEq2C59nru3vN4eTwxCWXtfmotMTEiIhZeMuvaNe7h2VuRzWENHscjerA6/oAqbWnMKhCXPXdZiit0nSXfSH2omjQ2F+C3Nu6TViiowiUjC4mH3G7pmIvXJpYpxzcWfJZdCvOW1Ozf0RQlFYWfUTQFYTENRLijukou+RCIYNByOe/RJOgeKPW5XKgZF+fl/hLyqHB5wlcme0S/bXDdtGqVePyqhGtAEjqPW9XbOw5sa27KawfoQ0kW61+f5MeH7Ez/byNEYwpuR2tlwy2G1Dev2RO/+X9v5gAsx2b3g9KbEN4hfsU5plhk= nicholas@nicholass-MacBook-Pro.local"
}

# variable "shared_resource_group" {
#   type    = string
#   default = "rg-aks-dev-shared-festivetech-uksouth"
# }

