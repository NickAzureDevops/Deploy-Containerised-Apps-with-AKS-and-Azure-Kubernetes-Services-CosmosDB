# Setting up Keyvault for Application Insights #

We will set up the key vaults for application insights.

- On your terminal, run the following command: 

az extension add --name application-insights to install the application insights extension for Azure CLI.
az monitor app-insights component show --app insights-aks-prod-festivetech-uksouth -g rg-aks-prd-shared-festivetech-uksouth 

(get the instrumentation key for the application insights. (make a note of the instrumentation key)

- Go to Prod Azure Keyvault and add the secret AIKEY with the value of the instrumentation key obtained from the previous step. 

- Go to the Azure DevOps, create a variable group, and give it a name. Link the variable group to your dev or prod key vault. In my case, I will link it to the prod key vault. See below for the screenshot of the variable group.

![variable group](/3-Infrastructure-Deployment/images/variable-group.png)

Please note the name of the variable group will need a reference as a variable in the cd-prod-aks-deployment file.


