variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "tags" {
  type    = map(string)
  default = {}
}

# ACR
variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}

# Container Apps
variable "container_app_name" {
  type = string
}

variable "container_app_environment_name" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}

variable "managed_identity_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "target_port" {
  type = number
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
  type    = number
  default = 0
}

variable "max_replicas" {
  type    = number
  default = 1
}

# Key Vault
variable "key_vault_name" {
  type = string
}

variable "key_vault_sku_name" {
  type    = string
  default = "standard"
}

variable "app_secret_value" {
  type      = string
  sensitive = true
}

# Monitoring
variable "metric_alert_name" {
  type = string
}

variable "cpu_threshold" {
  type    = number
  default = 80
}

variable "memory_threshold" {
  type    = number
  default = 80
}

# DNS
variable "domain_name" {
  type = string
}

variable "subdomain" {
  type = string
}
# test
