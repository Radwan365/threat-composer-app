variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "sku_name" {
  type        = string
  description = "SKU name for the Key Vault (e.g., 'standard' or 'premium')"
  default     = "standard"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID for the Key Vault"
}

variable "container_app_principal_id" {
  type        = string
  description = "Principal ID of the container app's managed identity for Key Vault access"
}

variable "app_secret_name" {
  type        = string
  description = "Name of the secret stored in Key Vault"
  default     = "app-secret"
}

variable "app_secret_value" {
  type        = string
  description = "Value of the secret stored in Key Vault"
  sensitive   = true
}
