resource "azurerm_user_assigned_identity" "uami" {
  location            = var.location
  name                = "uami-${var.name_suffix}"
  resource_group_name = var.rgname
}