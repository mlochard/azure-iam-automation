<#
.SYNOPSIS
    Identifies users using weak MFA methods (SMS/Voice).

.DESCRIPTION
    Helps IAM teams enforce stronger MFA like Authenticator App or FIDO2.

.REQUIREMENTS
    - User.Read.All
    - Directory.Read.All
#>

Connect-MgGraph -Scopes "User.Read.All","Directory.Read.All"

$users = Get-MgUser -All -Property StrongAuthenticationMethods

$weak = foreach ($u in $users) {
    $methods = $u.StrongAuthenticationMethods | Select-Object MethodType
    if ($methods.MethodType -contains "Sms" -or $methods.MethodType -contains "Voice") {
        [PSCustomObject]@{
            User = $u.UserPrincipalName
            Methods = ($methods.MethodType -join ", ")
        }
    }
}

$weak | Format-Table
