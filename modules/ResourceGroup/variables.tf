variable "rg_prefix" {
  description = "The prefix to use for the resource group"
  type        = string
}

variable "env_prefix" {
  description = "The environment to use for the resource group"
  type        = string
}

variable "tla" {
  description = "The TLA to use for the resource group"
  type        = string
}

variable "location" {
  description = "The location to use for the resource group"
  type        = string
}

variable "location_suffix" {
  description = "The location suffix to use for the resource group"
  type        = string
}