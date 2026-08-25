variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "acr_sku" {
  type        = string
  description = "SKU of the Azure Container Registry (e.g., Basic, Standard, Premium)"
}

variable "container_app_principal_id" {
  type        = string
  description = "Principal ID of the container app's managed identity for ACR access"
}
