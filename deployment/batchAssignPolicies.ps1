$policyDefRootFolder = "$Env:ROOT_FOLDER/policydefinitions"
$subscriptionId = "$Env:SUBSCRIPTION_ID"
$releaseEnvironment = "$Env:RELEASE_ENVIRONMENT"


Write-Host policyDefRootFolder: $policyDefRootFolder
Write-Host subscriptionId: $subscriptionId
Write-Host releaseEnvironment: $releaseEnvironment

foreach ($policyDefFolder in (Get-ChildItem -Path $policyDefRootFolder -Directory)) {

    Write-Host Processing folder: $policyDefFolder.Name
    $policy = Get-AzPolicyDefinition -Name $policyDefFolder.Name
    $policyParamater = "$($policyDefFolder.FullName)\values.($releaseEnvironment).json"

    Write-Host Creating assignment for: $policy
    Write-Host Creating assignment for: $policyParamater

    New-AzPolicyAssignment -Name $policyDefFolder.Name -PolicyDefinition $policy -Scope $subscriptionId -PolicyParameter $policyParamater
}