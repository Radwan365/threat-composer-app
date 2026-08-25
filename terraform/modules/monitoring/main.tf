resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = var.metric_alert_name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  description         = "CPU usage alert"
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "CpuPercentage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.cpu_threshold
  }
}

resource "azurerm_monitor_metric_alert" "memory_alert" {
  name                = "${var.metric_alert_name}-memory"
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  description         = "Memory usage alert"
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "MemoryPercentage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.memory_threshold
  }
}

