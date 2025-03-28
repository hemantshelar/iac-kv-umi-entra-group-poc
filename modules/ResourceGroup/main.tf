# Purpose: Create a resource group in Azure
# Usage: rg-dev-tfdemo-aae

resource "azurerm_resource_group" "rg" {
  name =   join("-", [var.rg_prefix, var.env_prefix,var.tla,var.location_suffix])
  location = "${var.location}"
  tags = {
        environment = var.env_prefix
    }
}