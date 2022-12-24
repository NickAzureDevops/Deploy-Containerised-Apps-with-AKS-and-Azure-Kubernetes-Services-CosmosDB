# Infrastructure Deployment #

In this section, we will deploy the Azure resources using Terraform infrastructure as code tool. Azure Container Registry will store the container image before deploying it to Azure Kubernetes Services. The application will have a Cosmos DB database that holds the data required for the application to run while storing the secrets in Azure Key Vault.
 
The application deployed to the cluster will use Azure Log Analytics workspace and Azure Application Insights for monitoring the infrastructure. 

[Deploy_Infrastructure](deploy-infrastructure.md) - Deploying the infrastructure using Terraform

[Setup Key Vault](./setup-keyvaults.md) - Setting up Key Vaults for application insights

[Kubernetes Deployment](./kubernetes-deployment.md) - Deploying the application to the cluster

[Notes](./useful-info.md)   - Useful information