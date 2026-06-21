<#
.SYNOPSIS
    Exports all Conditional Access policies.

.DESCRIPTION
    Creates a JSON backup of all CA policies for governance,
    auditing, and version control.

.REQUIREMENTS
    - Policy.Read.All
#>

Connect-MgGraph -Scopes "Policy.Read.All"

$policies = Get-MgIdentityConditionalAccessPolicy -All

$policies | ConvertTo-Json -Depth 10 | Out-File "./ConditionalAccessBackup.json"
