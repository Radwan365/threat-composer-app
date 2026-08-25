resource "azurerm_key_vault" "key_vault" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku_name                   = var.sku_name
  tenant_id                  = var.tenant_id
  rbac_authorization_enabled = true
}

resource "azurerm_role_assignment" "container_app_secrets_access" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.container_app_principal_id
}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "deployer_secrets_officer" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_secret" "app_secret" {
  name         = var.app_secret_name
  value        = var.app_secret_value
  key_vault_id = azurerm_key_vault.key_vault.id

  depends_on = [azurerm_role_assignment.deployer_secrets_officer]
}
