
module "ResourceGroup" {
  source          = "../modules/ResourceGroup"
  rg_prefix       = var.rg_prefix
  env_prefix      = var.env_prefix
  tla             = var.tla
  location        = var.location
  location_suffix = var.location_suffix
}

module "UserManagedIdentity" {
  source     = "../modules/UserManagedIdentity"
  location    = var.location
  rgname      = module.ResourceGroup.rgname
  name_suffix = module.ResourceGroup.name_suffix
  depends_on = [module.ResourceGroup]
}

module "AppServicePlan" {
  source      = "../modules/AppServicePlan"
  location    = var.location
  rgname      = module.ResourceGroup.rgname
  name_suffix = module.ResourceGroup.name_suffix
  depends_on  = [module.ResourceGroup, module.UserManagedIdentity]
}

module "WebApp" {
  source      = "../modules/WebApp"
  location    = var.location
  rgname      = module.ResourceGroup.rgname
  name_suffix = module.ResourceGroup.name_suffix
  app_service_plan_id = module.AppServicePlan.app_service_plan_id
  umi_id = module.UserManagedIdentity.id
  umi_principal_id = module.UserManagedIdentity.principal_id
  depends_on  = [module.ResourceGroup, module.UserManagedIdentity, module.AppServicePlan]
}


module "KeyVault" {
  source      = "../modules/KeyVault"
  location    = var.location
  rgname      = module.ResourceGroup.rgname
  name_suffix = module.ResourceGroup.name_suffix
  principal_id = module.UserManagedIdentity.principal_id
  depends_on  = [module.ResourceGroup, module.UserManagedIdentity] 
}


