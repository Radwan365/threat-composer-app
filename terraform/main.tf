data "azurerm_resource_group" "rg-threat-composer" {
  name = var.resource_group_name
}

data "azurerm_client_config" "current" {}

module "acr" {
  source = "./modules/acr"

  resource_group_name        = data.azurerm_resource_group.rg-threat-composer.name
  location                   = data.azurerm_resource_group.rg-threat-composer.location
  acr_name                   = var.acr_name
  acr_sku                    = var.acr_sku
  container_app_principal_id = module.container_apps.managed_identity_principal_id
}

module "container_apps" {
  source = "./modules/container_apps"

  resource_group_name            = data.azurerm_resource_group.rg-threat-composer.name
  location                       = data.azurerm_resource_group.rg-threat-composer.location
  container_app_name             = var.container_app_name
  container_app_environment_name = var.container_app_environment_name
  log_analytics_workspace_name   = var.log_analytics_workspace_name
  managed_identity_name          = var.managed_identity_name
  acr_login_server               = module.acr.acr_login_server
  image_name                     = var.image_name
  image_tag                      = var.image_tag
  target_port                    = var.target_port
  cpu                            = var.cpu
  memory                         = var.memory
  min_replicas                   = var.min_replicas
  max_replicas                   = var.max_replicas
  tags                           = var.tags
}

module "keyvault" {
  source = "./modules/keyvault"

  resource_group_name        = data.azurerm_resource_group.rg-threat-composer.name
  location                   = data.azurerm_resource_group.rg-threat-composer.location
  key_vault_name             = var.key_vault_name
  sku_name                   = var.key_vault_sku_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  container_app_principal_id = module.container_apps.managed_identity_principal_id
  app_secret_value           = var.app_secret_value
  app_secret_expiration_date = var.app_secret_expiration_date
  local_deployer_object_id   = var.local_deployer_object_id
  ci_deployer_object_id      = var.ci_deployer_object_id
}

module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = data.azurerm_resource_group.rg-threat-composer.name
  metric_alert_name   = var.metric_alert_name
  scopes              = [module.container_apps.container_apps.container_apps_id]
  cpu_threshold       = var.cpu_threshold
  memory_threshold    = var.memory_threshold
}

module "dns" {
  source = "./modules/dns"

  resource_group_name           = data.azurerm_resource_group.rg-threat-composer.name
  domain_name                   = var.domain_name
  subdomain                     = var.subdomain
  container_app_id              = module.container_apps.container_apps.container_apps_id
  container_app_fqdn            = module.container_apps.container_app_fqdn
  container_app_verification_id = module.container_apps.container_app_verification_id
}
