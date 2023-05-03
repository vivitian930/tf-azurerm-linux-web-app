output "web_app_id" {
  value = azurerm_linux_web_app.this.id
}
output "web_app_identity_principal_id" {
  value = length(azurerm_linux_web_app.this.identity) > 0 ? azurerm_linux_web_app.this.identity[0].principal_id : null
}