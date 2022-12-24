## Integrate AKS using Workload Identity ##

In this lab, we will look into integrating AKS with Azure Active Directory using Workload Identity. It will allow the resource to use Azure AD to authenticate and authorise users to access the AKS cluster.

When you run a workload, you often need to access protected resources in both a secure way and the resources inside the cluster. By integrating with Azure AD, you can use the same identity to access the workload, and the resources called workload identity. It works well with the Azure Identity client library using the Azure SDK and the Microsoft Authentication Library (MSAL) if you use application registration.

To start with Workload Identity, you must first enable it on the AKS cluster. We will look into configuring. 

## Create Azure AD App ##

- Run az aks show -n CLUSTERNAME -g RESOURCEGROUPNAME to get the issuer URL and make a note of it

- Create a new Azure AD App Registration using the Azure Portal.

- Go to certificates and secrets and click on federated credentials, then click add credentials and select the option Kubernetes accessing Azure resources.

![azuread federeated creds](/3-Infrastructure-Deployment/images/azuread-federeated-creds.png)

- populate the issuer URL from the previous step, make it the same namespace as your cluster for the application and give your service account and credentials a name. The service account name should be the same as the service account script. 

![federeated creds](/3-Infrastructure-Deployment/images/federeated-creds.png)

Give the service principle contributor access to the resource group, so it can access the cluster. I recommend giving it access to the entire subscription.

## Set up Azure workload identity via helm ##

To set up Azure workload identity, you must install the workload-identity-webhook Helm chart. This chart installs the workload-identity-webhook component required for the Azure workload identity feature. 

Run the following commands to install the chart:

- helm repo add azure-workload-identity https://azure.github.io/azure-workload-identity/charts
- helm repo update
- helm install workload-identity-webhook azure-workload-identity/workload-identity-webhook \
 --namespace azure-workload-identity-system \
 --create-namespace \
 --set azureTenantID="${AZURE_TENANT_ID}" (Replace the tenant ID with your tenant ID)

Get the pods and service from the installed chart.

- kubectl get pods -n azure-workload-identity-system

- kubectl get svc -n azure-workload-identity-system

![webhook pods](/3-Infrastructure-Deployment/images/webhook-pods.png)

Run the service account [here](./terraform/scripts/service-account.yml script to create a service account and a role binding for the service account. This script creates a service account named aks-identity-binding and a role binding called aks-identity-binding. 

Replace the client ID and tenant ID with the values from the service account annotation.

- Apply the [service-account](./terraform/scripts/service-account.yml using kubectl apply -f ./service-account.yml if your in the same directory as the file.

- Update the Deployment script [here](./terraform/scripts/deployment.yml with the values from the service account annotation. Run the script using kubectl apply -f ./deployment.yml. 


Note: if the cluster workload is having an issue, please rerun the service account script before rerunning the deployment script. 

Awesome, it is working.

References: 

https://docs.microsoft.com/en-us/azure/aks/use-azure-ad-pod-identity

https://learn.microsoft.com/en-us/azure/aks/learn/tutorial-kubernetes-workload-identity

