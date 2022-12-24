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
  type        = string
  description = "The name of the shared resource group"
}

variable "ssh_public_key" {
  type        = string
  description = "The SSH public key to use for the cluster nodes"
}

variable "sku_name" {
  description = "The SKU name to use for the Key Vault"  
}

variable "secret_permissions" {
  type        = list(string)
  description = "The secret permissions to use for the Key Vault"
}

variable "key_permissions" {
  type        = list(string)
  description = "The key permissions to use for the Key Vault"

}

variable "storage_permissions" {
  type        = list(string)
  description = "The storage permissions to use for the Key Vault"
}
