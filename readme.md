# Deploy containerised apps with Azure Kubernetes Service & Azure Cosmos DB #

![Festive Tech Calender 2022 ](/image/festivetechcalender2022.png)

This repo will contain all the information required to deploy containerise applications to Kubernetes Service and CosmosDB.

I have created this repo on behalf of the Festive Tech Calendar 2022.

## Prerequisites ##

- Azure Subscription
- Azure DevOps Account
- Azure CLI
- Terraform
- Docker Desktop

## Solution ##

The solution is a wishlist application that Pluralsight has created. https://github.com/pluralsight-projects/AspNetCore-WishList. It would be great to deploy into Azure. 

At the end of the lab, you will have a fully functional application deployed to Azure Kubernetes Service and Azure Cosmos DB.

1) Lab 1 - [Setting up Azure DevOps Project](./1-AzureDevOps-Setup/readme.md)  - This section will show you how to set up your Azure DevOps project and the backend for Terraform.

2) Lab 2 - [Deploy to Azure Container Registry](./2-Deploy-to-ACR/readme.md) - How to build and push the image to Azure Container Registry

3) Lab 3 - [Deploy Infrastructure to AKS using Terraform via Azure DevOps Pipeline](./3-Infrastructure-Deployment/readme.md) - Include Terraform modules and Azure DevOps pipelines for infrastructure deployment

4) Lab 4 - [Integrate AKS cluster to Azure Cosmos Database](./4-Integrate-to-CosmosDB/readme.md)  - Shows how to integrate the AKS cluster to Azure Cosmos DB

5) Lab 5 - [Testing Resources](./5-Testing-Resources/readme.md) - Provides method of testing infrastructure resources before deploying to production.

6) Lab 6 - [Montioring Resources](./6-Monitoring/readme.md) - Monitor infrastructure resources.

I hope you enjoy the lab and learn something new :) 

Please contact me on social media for any questions or feedback. 