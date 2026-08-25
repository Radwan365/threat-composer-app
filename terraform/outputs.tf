# outputs.tf
output "container_app_default_fqdn" {
  description = "The auto-generated *.azurecontainerapps.io URL"
  value       = module.container_apps.container_app_fqdn
}

output "custom_domain_fqdn" {
  description = "The custom domain once DNS has propagated and validated"
  value       = module.dns.custom_domain_fqdn
}

output "dns_zone_name_servers" {
  description = "Update these at your domain registrar to delegate the zone to Azure DNS"
  value       = module.dns.dns_zone_name_servers
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "key_vault_uri" {
  value = module.keyvault.key_vault_uri
}
