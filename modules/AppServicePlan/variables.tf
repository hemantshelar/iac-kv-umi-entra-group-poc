/*Following two can be found in output of ResourceGoup module*/
variable "rgname" {
  description = "The name of the resource group"
  type        = string
}

variable "name_suffix" {
  description = "The suffix to use for the resource group"
  type        = string
}

variable "location" {
  description = "The location to use for the resource group"
  type        = string
  
}