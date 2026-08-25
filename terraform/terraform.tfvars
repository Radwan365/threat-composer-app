resource_group_name = "rg-threat-composer"
location            = "eastus"

acr_name = "acrthreatcomposerradwan2026"
acr_sku  = "Basic"

container_app_name             = "threat-composer-app"
container_app_environment_name = "threat-composer-env"
log_analytics_workspace_name   = "threat-composer-logs"
managed_identity_name          = "threat-composer-identity"

image_name  = "threat-composer"
image_tag   = "latest"
target_port = 3000

cpu          = 0.25
memory       = "0.5Gi"
min_replicas = 0
max_replicas = 1

key_vault_name     = "kv-tc-radwan2026"
key_vault_sku_name = "standard"

metric_alert_name = "threat-composer-alerts"
cpu_threshold     = 80
memory_threshold  = 80

domain_name = "theradwan.com"
subdomain   = "app"
