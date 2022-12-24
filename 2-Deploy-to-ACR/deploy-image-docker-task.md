# Push Docker Image via Docker Task #

Create a new service connection for the ACR. It will allow us to push the docker image to ACR.

Go to Project Settings -> Service Connections -> New Service Connection -> Docker Registry -> Azure Container Registry -> Select your ACR and give the service connection a name and save it.

![Dev_Docker_Service_Connection](/2-Deploy-to-ACR//images/service_connection.png)

Create another docker service connection for the prod environment too. However, if you run into an issue with the service connection, it is because the service principle permission is missing, and you will need to re-create it. Please note you need to put your container registry fully qualified name, such as acrprodfestivetechuksouth.azurecr.io; otherwise, you will run into an issue. 

We will use the Docker task to push the docker image to ACR.

```yaml
- task: Docker@2
 displayName: 'Push an image to Azure Container Registry'
 inputs:
 command: buildAndPush
 repository: 
 dockerfile: 
 containerRegistry: 
 tags: |
 latest
```

Go to Azure DevOps, create a new pipeline, and select the file found under the pipeline folder called Deploy-and Push image.yml. Run the pipeline, and once completed, you should see the image in the ACR.

![Deloy_Image](/2-Deploy-to-ACR//images/deploy-image.png)

![Deployed_Image](/2-Deploy-to-ACR//images/acr-image.png)

On the Deploy-and Push image.yml file, there is a Trivy job that will scan the image for vulnerabilities. The first job will install it via bash script, and the second job will check the image. It will fail if there are any vulnerabilities found. You can change the severity level of the job.

Trivy is a simple and comprehensive vulnerability scanner for containers and other artefacts, suitable for CI. It detects vulnerabilities in OS packages (Alpine, RHEL, CentOS, etc.) and application dependencies (Bundler, Composer, npm, yarn, etc.). It is easy to use and has no dependencies.

![Trivy Results](/2-Deploy-to-ACR/images/trivy-results.png)
