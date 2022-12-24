# Set up Terraform Backend #

Terraform backend is remote storage where terraform state is stored. It stores the state of the infrastructure. The state file can often track the mapping between the configuration and the actual state of the infrastructure.

## Create Terraform Backend ##

To create the backend, run the storage backend PowerShell script to create a resource group, container and storage account. 

The backend for the terraform code will create a service principal in Azure DevOps to access the storage account. It will use the backend as azurerm with the storage account as the backend in Azure DevOps. An example of a backend used in this lab is below.

```tf
terraform {

 backend "azurerm" {
 }

 required_version = ">= 0.14"

```

Further details on the terraform backend:

<https://developer.hashicorp.com/terraform/language/settings/backends/configuration>

<https://developer.hashicorp.com/terraform/language/settings/backends/remote>

