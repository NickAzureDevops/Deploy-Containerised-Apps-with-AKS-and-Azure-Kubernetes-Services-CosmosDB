# Deploy to Azure Container Registry #

This stage of the lab will show you on how to deploy the Wishlist Application to Azure Container Registry.

There are 2 option we can deploy the application to ACR. The first option is to use the Azure CLI task to build the docker image and push it to the ACR. The second option is to use the Docker task to build the docker image and push it to the ACR. The Azure CLI task is a bit more flexible as it allows you to run any command you want.

For this lab, I will use the Docker task via the Azure DevOps pipeline. I will show you how to deploy it via Azure Cli too.

- Go to the file [Deploy Image via Azure CLI](./deploy-image-cli.md) to start deploying the application to ACR.

- The [Deploy Image via Docker Task](./deploy-image-docker-task.md) will contain information you need to build the docker image and push it from your local machine to Azure.


