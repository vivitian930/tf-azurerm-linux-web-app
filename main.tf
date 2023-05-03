

resource "azurerm_service_plan" "this" {
  count               = var.existing_app_service_plan_id == "" ? 1 : 0
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.app_service_plan_sku
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.existing_app_service_plan_id != "" ? var.existing_app_service_plan_id : azurerm_service_plan.this[0].id

  app_settings = var.app_settings

  dynamic "identity" {
    for_each = local.identity_type == "SystemAssigned" ? [1] : []
    content {
      type = local.identity_type
    }
  }

  dynamic "identity" {
    for_each = local.identity_type == "SystemAssigned, UserAssigned" || local.identity_type == "UserAssigned" ? [1] : []
    content {
      type         = local.identity_type
      identity_ids = var.user_assigned_managed_ids
    }
  }

  site_config {
    always_on                 = var.always_on
    http2_enabled             = var.http2_enabled
    minimum_tls_version           = var.min_tls_version
    application_stack {
      docker_image     = var.docker_image
      docker_image_tag = var.docker_image_tag
    }
  }
}
