resource "azurerm_service_plan" "sp" {
    name = join("-", ["asp",var.name_suffix])
    resource_group_name = var.rgname
    location = var.location
    sku_name = "F1"
    os_type = "Linux"
}