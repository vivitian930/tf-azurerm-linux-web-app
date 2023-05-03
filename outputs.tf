output "web_app_id" {
  value = azurerm_app_service.this.id
}
output "web_app_identity_principal_id" {
  value = length(azurerm_app_service.this.identity) > 0 ? azurerm_app_service.this.identity[0].principal_id : null
}