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
variable "vm_size" {
  type        = string
  description = "The vm size of the node of aks cluster"
}
variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version to use"
}
# variable "agent_node" {
#   type        = number
#   description = "The number of nodes in the node pool"
# }
variable "dns_prefix" {
  type        = string
  description = "The DNS prefix to use with the hosted Kubernetes API server FQDN"
}
variable "kubernetes_cluster_rbac_enabled" {
  type        = bool
  description = "Enable Kubernetes Role-Based Access Control"
}
variable "ssh_public_key" {
  type = string
  description = "The ssh public key to use for the nodes"
}
variable "enable_auto_scaling" {
  type = bool
  description = "Enable auto scaling for the node pool"
}
variable "log_analytics_workspace_id" {
  type = string
  description = "The workspace id for the application insights"
}
  