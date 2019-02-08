output "webapp_hostname" {
  value = "${azurerm_app_service.appsvc.default_site_hostname}"
}
