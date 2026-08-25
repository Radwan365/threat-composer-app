# outputs.tf
output "dns_zone_name_servers" {
  description = "Azure-assigned name servers — update these at your domain registrar to delegate the zone"
  value       = azurerm_dns_zone.this.name_servers
}

output "custom_domain_fqdn" {
  description = "The full custom domain pointing at the container app"
  value       = "${var.subdomain}.${var.domain_name}"
}
