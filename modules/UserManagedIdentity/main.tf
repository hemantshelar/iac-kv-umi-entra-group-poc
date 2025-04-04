resource "azurerm_user_assigned_identity" "uami" {
  location            = var.location
  name                = "uami-${var.name_suffix}"
  resource_group_name = var.rgname
}

#used for attaching to the web app
output "id" {
  value       = azurerm_user_assigned_identity.uami.id
  description = "The ID of the User Managed Identity."
}

#used in configuring RBAC roles
output "principal_id" {
  value       = azurerm_user_assigned_identity.uami.principal_id
  description = "The ID of the User Managed Identity."
}
