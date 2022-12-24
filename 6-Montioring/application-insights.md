# Montior application using Application Insights #

Application Insights is a service that monitors your live web application. It will automatically detect performance anomalies and diagnose issues. 

We will use the application insights service to monitor the application deployed in the AKS cluster.

## Application Insights ##

Go to Azure Portal and find the provisioned Application Insights resource. Azure Application Insights has a built-in dashboard that shows your application's health with monitoring for performance, availability, and usage. Some of the features are:

- Live metrics stream - The Live Metrics Stream shows your application's real-time performance. 

![Live metrics](/6-Montioring/images/live-metrics.png)


- Application Map - See how your application is architected and how it is performing. You can see the performance of your application over time and drill down the performance of individual components.

![Application Map](/6-Montioring/images/application-map.png)

- Performance analysis - Diagnose performance issues and find the cause of a performance problem.

- Failure analysis - Diagnose failures and find the cause of the issue. Open the failure details to see the stack trace and other information.

![Failure](/6-Montioring/images/failures.png)


- Usage analysis - Understand how your users are using your application. The usage analysis shows you the number of users, sessions, and page views. Below is the usage analysis for the application deployed in the AKS cluster.

![Usage](/6-Montioring/images/usage.png)


References: 

- https://github.com/microsoft/ApplicationInsights-Kubernetes

- https://docs.microsoft.com/en-us/azure/azure-monitor/app/asp-net-core

