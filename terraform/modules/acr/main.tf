#checkov:skip=CKV_AZURE_166:Requires Premium SKU; Basic used for this project's scale
#checkov:skip=CKV_AZURE_237:Requires Premium SKU; Basic used for this project's scale
#checkov:skip=CKV_AZURE_167:Requires Premium SKU; Basic used for this project's scale
#checkov:skip=CKV_AZURE_233:Requires Premium SKU; Basic used for this project's scale
#checkov:skip=CKV_AZURE_165:Single-region deployment; geo-replication not applicable
#checkov:skip=CKV_AZURE_139:No VNet in v1 architecture; public access required until private endpoints are added
#checkov:skip=CKV_AZURE_164:Docker Content Trust being deprecated across ACR; low value
#checkov:skip=CKV_AZURE_163:Image scanning handled pre-push via Trivy in docker.yml instead
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.acr_sku
  admin_enabled       = false
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = var.container_app_principal_id
}
