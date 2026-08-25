# variables.tf
variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "container_app_name" {
  type = string
}

variable "container_app_environment_name" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}

variable "log_analytics_sku" {
  type    = string
  default = "PerGB2018"
}

variable "log_analytics_retention_in_days" {
  type    = number
  default = 30
}

variable "managed_identity_name" {
  type = string
}

variable "acr_login_server" {
  description = "From the acr module's output — wire it in via root main.tf."
  type        = string
}

variable "image_name" {
  type = string
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "target_port" {
  description = "Must match whatever port your Dockerfile actually exposes."
  type        = number
}

variable "cpu" {
  type    = number
  default = 0.25
}

variable "memory" {
  type    = string
  default = "0.5Gi"
}

variable "min_replicas" {
  description = "0 gets you actual scale-to-zero on the Consumption plan."
  type        = number
  default     = 0
}

variable "max_replicas" {
  type    = number
  default = 1
}

variable "tags" {
  type    = map(string)
  default = {}
}
