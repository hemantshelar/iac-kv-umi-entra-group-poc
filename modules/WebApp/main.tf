
resource "azurerm_windows_web_app" "webapp" {
  name                = "webapp-${var.name_suffix}"
  location            = var.location
  resource_group_name = var.rgname
  site_config {
    always_on = false
    
  }
    identity {
        type = "UserAssigned"
        identity_ids = [var.umi_id]
    }
  service_plan_id = var.app_service_plan_id
  #to enable key vault reference in app settings
  key_vault_reference_identity_id = var.umi_id
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}
variable "rgname" {
  description = "The name of the resource group."
  type        = string
}

variable "name_suffix" {
  description = "The suffix to append to the resource names."
  type        = string
}
variable "app_service_plan_id" {
  description = "The ID of the App Service Plan."
  type        = string
}

variable "umi_id" {
  description = "The ID of the User Managed Identity."
  type        = string
}

variable "umi_principal_id" {
  description = "The principal ID of the User Managed Identity."
  type        = string
}