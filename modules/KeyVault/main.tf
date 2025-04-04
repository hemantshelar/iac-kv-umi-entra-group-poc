data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
  name                        = "kv-${var.name_suffix}"
  location                    = var.location
  resource_group_name         = var.rgname 
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  
  ## Folloing config value will be set to true when we are using RBAC for Key Vault access policies.
  enable_rbac_authorization = true

  sku_name = "standard"
}

/*resource "azurerm_role_assignment" "kvso" {
  principal_id   = "9f60010f-0554-48c6-9c73-b7d98125c7b4"# data.azurerm_client_config.current.object_id
  role_definition_name = "Key Vault Secrets Officer"
  scope          = azurerm_key_vault.kv.id
}*/

/*resource "azurerm_key_vault_access_policy" "admin" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "9f60010f-0554-48c6-9c73-b7d98125c7b4"

  secret_permissions = [
    "Get","List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"
  ]
}*/

/*
resource "azurerm_role_assignment" "kvadmin" {
  principal_id   = "9f60010f-0554-48c6-9c73-b7d98125c7b4"# data.azurerm_client_config.current.object_id
  role_definition_name = "Key Vault Secrets Officer"
  scope          = azurerm_key_vault.kv.id
}
*/

resource "azurerm_role_assignment" "kvso" {
  principal_id   = var.principal_id
  role_definition_name = "Key Vault Secrets Officer"
  scope          = azurerm_key_vault.kv.id
  
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
variable "principal_id" {
  description = "The ID of the Key Vault."
  type        = string
}

output "whoami" {
  value = data.azurerm_client_config.current.object_id
}