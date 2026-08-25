output "container_apps" {
  value = {
    container_apps    = azurerm_container_app.container_apps.name
    container_apps_id = azurerm_container_app.container_apps.id
  }
}

output "container_apps_environment" {
  value = {
    container_apps_environment    = azurerm_container_app_environment.container_apps_environment.name
    container_apps_environment_id = azurerm_container_app_environment.container_apps_environment.id
  }
}

output "container_apps_log_analytics_workspace" {
  value = {
    container_apps_log_analytics_workspace    = azurerm_log_analytics_workspace.container_apps_log_analytics_workspace.name
    container_apps_log_analytics_workspace_id = azurerm_log_analytics_workspace.container_apps_log_analytics_workspace.id
  }
}

output "managed_identity_principal_id" {
  value = azurerm_user_assigned_identity.managed_identity.principal_id
}

output "container_app_fqdn" {
  description = "The default *.azurecontainerapps.io URL"
  value       = azurerm_container_app.container_apps.ingress[0].fqdn
}

output "container_app_verification_id" {
  description = "Used to create the DNS TXT record proving domain ownership"
  value       = azurerm_container_app.container_apps.custom_domain_verification_id
}

