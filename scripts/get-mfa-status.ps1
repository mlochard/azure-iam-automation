<#
.SYNOPSIS
    Lists all users without MFA enabled.

.DESCRIPTION
    Audits MFA registration using Microsoft Graph PowerShell.
    Useful for IAM governance and Zero Trust enforcement.

.REQUIREMENTS
    - Microsoft Graph PowerShell SDK
    - User.Read.All
    - Directory.Read.All
#>

Connect-MgGraph -Scopes "User.Read.All","Directory.Read.All"

$users = Get-MgUser -All -Property DisplayName,UserPrincipalName,StrongAuthenticationMethods

$noMFA = $users | Where-Object {
    $_.StrongAuthenticationMethods.Count -eq 0
}

$noMFA | Select DisplayName, UserPrincipalName | Format-Table
