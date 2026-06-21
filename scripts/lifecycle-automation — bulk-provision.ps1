<#
.SYNOPSIS
    Bulk provisions users from CSV.

.DESCRIPTION
    Automates identity lifecycle onboarding using Microsoft Graph.

.REQUIREMENTS
    - User.ReadWrite.All
#>

Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv "./new_users.csv"

foreach ($u in $users) {
    New-MgUser -DisplayName $u.DisplayName `
               -UserPrincipalName $u.UserPrincipalName `
               -MailNickname $u.MailNickname `
               -PasswordProfile @{ Password = $u.Password } `
               -AccountEnabled $true
}
