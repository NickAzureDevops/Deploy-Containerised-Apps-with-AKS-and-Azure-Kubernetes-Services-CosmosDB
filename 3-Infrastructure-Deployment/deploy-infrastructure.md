# Deployment of ≈ using Terraform via Azure DevOps Pipeline #

In this lab, we will deploy the infrastructure using Terraform via Azure DevOps Pipeline. We will use the Terraform task to deploy the infrastructure. The Terraform task is a task that allows you to run Terraform commands in your pipeline. It is available in the Azure DevOps Marketplace.

Note: Before deploying the code, you need to change the UPN on the terraform code that creates a group in Azure AD and add your account to it and grant your Azure DevOps service principle permission to create an Azure AD Group. 

- Go to Azure AD, and under roles and administrators, find Directory Readers and Directory Writers. Add the service principle to it.

## Deploying Dev Environment ##

We will use the Terraform task to deploy the infrastructure.

Go to Azure DevOps, create a new pipeline, and select the file [cd-dev.yaml](../environments/dev/cd-dev.yaml) by navigating to the terraform directory and pipelines folder. You should go into Azure Repos and get the path to the pipeline. 

![Pipeline path](/3-Infrastructure-Deployment/images/pipeline-path.png)

After you create the pipeline, you should see the following screen with all the resources deployed. This pipeline will deploy the infrastructure and the application in the dev environment.

![Pipeline](/3-Infrastructure-Deployment/images/dev-pipeline.png)

## Deploying Prod Environment ##

When you are ready to deploy to the production environment, you can create a new pipeline and select the file [cd-prod.yaml](../environments/prod/cd-prod.yaml). This pipeline shows you the continuous delivery of the application into the aks cluster. 

### Kubernetes Deployment ###

To deploy the application into the aks cluster, the image name in the [deployment.yaml](../environments/prod/deployment.yaml) file must point the image to the Azure Container Registry with the latest tag. 

After the pipeline runs successfully, you need to get the public IP address of the aks cluster and access the application. Go to the AKS cluster, and under the service blade, you should see a load balancer IP address from the deployment name. In this case, it would be the load balancer IP address.


![App AKS](/3-Infrastructure-Deployment/images/aks-deployment.png)

You can access the application by going to the IP address in the browser.

![Deployed Application](/3-Infrastructure-Deployment/images/wislist.png)

