resource "azurerm_dns_zone" "this" {
  name                = var.domain_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_txt_record" "verification" {
  name                = "asuid.${var.subdomain}"
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = 300

  record {
    value = var.container_app_verification_id
  }
}

resource "azurerm_dns_cname_record" "app" {
  name                = var.subdomain
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  record              = var.container_app_fqdn
}

resource "azurerm_container_app_custom_domain" "app" {
  name             = "${var.subdomain}.${var.domain_name}"
  container_app_id = var.container_app_id

  certificate_binding_type = "SniEnabled"

  depends_on = [
    azurerm_dns_txt_record.verification,
    azurerm_dns_cname_record.app
  ]

  lifecycle {
    ignore_changes = [certificate_binding_type, container_app_environment_certificate_id]
  }
}
