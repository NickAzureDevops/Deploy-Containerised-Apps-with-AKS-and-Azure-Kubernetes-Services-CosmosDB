### Useful information ###

The environment folder contains the Terraform files for the environment, such as dev and prod etc.
The Scripts folder contains the Kubernetes manifest for cluster modification 
src folder contains the application's source code.

The pipelines folder includes all the Azure DevOps pipelines for the application. 

- cd-dev.yaml 
- cd-prod.yaml
- cd-prod-aks-deployment.yml
- dev-schedule-destroy.yml
- prod-schedule-destroy.yml

If you like to destroy an environment, you should see a destroy option when you go to the pipeline run option in Azure DevOps. You can also use the scheduled pipeline every evening at 19:00 pm. 

I highly recommend using the scheduled pipeline to destroy the environment to avoid any cost. 

