output "rgname" {
  value = join("-", [var.rg_prefix, var.env_prefix,var.tla,var.location_suffix])
}

output "name_suffix" {
  value = join("-", [var.env_prefix,var.tla,var.location_suffix])
}

output "location" {
  value = var.location
}