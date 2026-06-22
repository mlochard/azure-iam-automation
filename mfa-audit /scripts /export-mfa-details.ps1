Connect-MgGraph -Scopes "User.Read.All","Directory.Read.All"

$users = Get-MgUser -All -Property DisplayName,UserPrincipalName,StrongAuthenticationMethods

$report = foreach ($u in $users) {
    [PSCustomObject]@{
        DisplayName = $u.DisplayName
        UPN = $u.UserPrincipalName
        Methods = ($u.StrongAuthenticationMethods.MethodType -join ", ")
    }
}

$report | Export-Csv "./mfa-registration-report.csv" -NoTypeInformation
