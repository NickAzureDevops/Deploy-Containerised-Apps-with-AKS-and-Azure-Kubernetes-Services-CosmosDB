# Testing Infrastrucuture #

This lab will look at how to test the AKS infrastructure code. We will use Checkov, an open-source static code analysis tool that scans Terraform code for security vulnerabilities. It is a great tool to ensure your Terraform code is secure. We will also be looking at how we can use Azure DevOps to run the Checkov scan as part of the build pipeline. 

Run the checkov pipeline here located here.

[checkov](./pipelines/checkov.yml)

# Running Checkov Pipeline #

- Create a new pipeline in Azure DevOps and select the checkov pipeline [here](./pipelines/checkov.yml).

- Go to Azure DevOps, navigate to branches under repo, click on the three dots and select branch policies 

![Branch Policies](/5-Testing-Resources/images/branch-policies.png)

- In the Build validation, add a new policy and select the checkov pipeline [here](./pipelines/checkov.yml). It will trigger a pull request created against the main branch. Please remember to choose the option "immediately when the main branch has updated".

![Build Policy](/5-Testing-Resources/images/build-policy.png)


After successfully running the pipeline, you should see the pipeline test results. The test result will provide information on the number of tests passed and failed as well as how to remediate the failed tests. 

![Checkov Results](/5-Testing-Resources/images/checkov-results.png)

