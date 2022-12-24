variable "environment" {
  type        = string
  description = "The environment of the azure resources"
}
variable "location" {
  type        = string
  description = "The location resources should be provisioned withins"
}


variable "tags" {
  description = "Tags that should be applied to resources created by this module. Runtime tag values will take precedent over compile time values"
  type        = map(string)
  default     = {}
}

variable "shared_resource_group" {
  type = string
  description = "The name of the resource group to provision resources within"
}

variable "offer_type" {
  type        = string
  description = "The type of cosmosdb account"
}

variable "cosmosdbaccount_kind" {
  type        = string
  description = "The kind of cosmosdb account"
}