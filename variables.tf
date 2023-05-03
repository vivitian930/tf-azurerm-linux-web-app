variable "name" {
  description = "Name of the Function App."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to create the Function App in."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resource"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Location to create the App Service Plan in, if different from the resource group location (Optional)."
  type        = string
  default     = ""
}

variable "existing_app_service_plan_id" {
  description = "Application Service Plan ID."
  type        = string
  default     = ""
}

variable "app_service_plan_sku" {
  type        = string
  description = "App Service Plan SKU."
  default     = "B1"
}

variable "os_type" {
  type        = string
  description = "App Service Plan OS Type."
  default     = "Linux"
}

variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan Name."
}

variable "system_assigned_managed_identity" {
  description = "Do we generate a system assigned managed identity for this function app? (Optional)"
  type        = bool
  default     = false
}

variable "user_assigned_managed_ids" {
  description = "Specifies a list of user managed identity ids to be assigned (Optional)"
  type        = list(string)
  default     = []
}

variable "docker_image" {
  type        = string
  description = "docker image to use"
  default     = ""
}

variable "docker_image_tag" {
  type        = string
  description = "docker image tag to use"
  default     = ""
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values. (Optional)"
  type        = map(any)
  default     = {}
}

variable "always_on" {
    type = bool
    description = "Should the function app be always on?"
    default = true
}

variable "http2_enabled" {
    type = bool
    description = "Should HTTP2 be enabled?"
    default = true
}

variable "min_tls_version" {
    type = string
    description = "The minimum supported TLS version for the web app"
    default = "1.2"
}