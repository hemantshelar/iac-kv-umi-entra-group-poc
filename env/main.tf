
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