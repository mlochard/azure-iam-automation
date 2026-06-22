<#
.SYNOPSIS
    Audits privileged role assignments.

.DESCRIPTION
    Identifies users with standing admin roles for PIM governance.

.REQUIREMENTS
    - RoleManagement.Read.Directory
#>

Connect-MgGraph -Scopes "RoleManagement.Read.Directory"

Get-MgRoleManagementDirectoryRoleAssignment -All |
    Select-Object PrincipalId, RoleDefinitionId, ResourceScope
