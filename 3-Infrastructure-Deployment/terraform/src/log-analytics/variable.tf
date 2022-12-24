variable "environment" {
  type        = string
  description = "The environment of the azure resources"
}
variable "tags" {
  description = "Tags that should be applied to resources created by this module. Runtime tag values will take precedent over compile time values"
  type        = map(string)
  default     = {}
}
variable "location" {
  type        = string
  description = "The location resources should be provisioned withins"
}
variable "shared_resource_group" {
  type = string
  description = "The name of the resource group to provision resources within"
}

variable "workspace_sku" {
  type        = string
  description = "The SKU of the Log Analytics Workspace"
}
