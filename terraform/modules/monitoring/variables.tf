variable "resource_group_name" {
  type = string
}

variable "scopes" {
  type = list(string)
}

variable "metric_alert_name" {
  type = string
}

variable "cpu_threshold" {
  type    = number
  default = 80
}

variable "memory_threshold" {
  type    = number
  default = 80
}

