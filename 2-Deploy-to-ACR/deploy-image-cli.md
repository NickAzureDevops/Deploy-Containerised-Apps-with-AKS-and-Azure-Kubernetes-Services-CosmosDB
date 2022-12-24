# Push Docker Image via Azure CLI #

Before we push the docker image to ACR, we must connect to Azure via Azure CLI.

- On your terminal window, type AZ login to log in to Azure.

- Navigate the Dockerfile location located under /2-Deploy-to-ACR/WishList

- Run the following command to build the docker image locally using the docker command.

 docker build . --tag "festivetechcalender2022:latest" --file ./Dockerfile (Please note --tag is the reference for tagging the image. You can change it to anything you want)

After you have built the image locally with docker, we will push it to ACR. However, before we do that, we need to log in to ACR. To do that, run the following command:

az acr login --name acrdevfestivetechuksouth

After you log in to ACR, we will push the image to ACR. To do that, we need to tag the image we must first tag it with the fully qualified name of the Azure container registry service. To do that, run the following command:

- docker tag festivetechcalender2022 acrdevfestivetechuksouth.azurecr.io/festivetechcalender2022:latest

At this point, the image should be in your local machine when you open the docker desktop. You can verify it by clicking on the images tab.

![Docker Desktop tagged image](/2-Deploy-to-ACR//images/docker-desktop.png)

We will now be able to push the image to ACR.

docker push acrdevfestivetechuksouth.azurecr.io/festivetechcalender2022:latest (Please note the image name is the same as the one you tagged in the previous step

![Docker image successful pushed](/2-Deploy-to-ACR//images/docker-push.png)

Go to the Azure portal and navigate to your ACR. You should see the image you just pushed.

![ACR image](/2-Deploy-to-ACR//images/acr-image.png)
