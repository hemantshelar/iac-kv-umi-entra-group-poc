output "app_service_plan_id" {
  value =  azurerm_service_plan.sp.id
  description = "The ID of the App Service Plan."
}