# Azure Policy Automation

This project contains a reference implementation for managing azure policy programatically as part of a CI/CD process.

## Project Structure

### Policy Definitions

The policy definitions are created using JSON, and stored in source control. Each policy has it's own set of files, such as the parameters, and environment values, that should be stored in the same folder. The following structure is leveraged by the automated deployment mechanism to deploy the polices into azure subscriptions or managment groups.

```

|
|- policydefinitions/  ______________ # Root folder for policies
|  |- policy1/  _____________________ # Subfolder for a policy
|     |- policydef.json _____________ # Policy definition
|     |- policydef.params.json ______ # Policy definition of parameters
|     |- values.dev.json ____________ # Parameters for a Dev environment
|     |- values.prod.json ___________ # Parameters for a Prod environment
|
|  |- policy2/  _____________________ # Subfolder for a policy
|     |- policydef.json ______________# Policy definition
|     |- policydef.params.json ______ # Policy definition of parameters
|     |- values.dev.json ____________ # Parameters for a Dev environment
|     |- values.prod.json ___________ # Parameters for a Prod environment

```

### Deployment Scripts

Two Powershell scripts are responsible for deploying the policy definition and assigning it to a subscription.

TODO: The use of Management Groups is prefered. Update for scripts MG support

```
|
|- deployment
|  |- batchAssignPolicies.ps1
|  |- batchCreatePolicies.ps1
|
```
### Azure DevOps Pipelines

The execution of the deployment scripts should be orchestrated via Azure DevOps piplines. The following pipline definitions are responsible for defining the packaging and release processes.

```
|
|- azure-pipelines-build.yml
|- azure-pipelines-release.yml
|
```

## Reference

* https://docs.microsoft.com/en-us/azure/governance/policy/how-to/programmatically-create
* https://docs.microsoft.com/en-us/azure/governance/policy/concepts/policy-as-code