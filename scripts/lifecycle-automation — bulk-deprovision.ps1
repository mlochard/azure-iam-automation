<#
.SYNOPSIS
    Bulk disables and offboards users.

.DESCRIPTION
    Automates secure offboarding and license removal.

.REQUIREMENTS
    - User.ReadWrite.All
#>

Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv "./offboard.csv"

foreach ($u in $users) {
    Update-MgUser -UserId $u.UserPrincipalName -AccountEnabled:$false
    Set-MgUserLicense -UserId $u.UserPrincipalName -RemoveLicenses @("*")
}
