variable "resource_group_name" {
  type        = string
  description = "Resource group for the DNS zone and records"
}

variable "domain_name" {
  type        = string
  description = "Your registered domain, e.g. example.com"
}

variable "subdomain" {
  type        = string
  description = "Subdomain label to point at the app, e.g. 'app' for app.example.com"
}

variable "container_app_fqdn" {
  type        = string
  description = "The container app's default ingress FQDN — from the container_apps module"
}

variable "container_app_verification_id" {
  type        = string
  description = "The container app's domain verification ID — from the container_apps module"
}

variable "container_app_id" {
  type        = string
  description = "The container app's resource ID — from the container_apps module"
}
