Connect-MgGraph -Scopes "RoleManagement.Read.Directory"

$assignments = Get-MgRoleManagementDirectoryRoleAssignment -All

$standing = $assignments | Where-Object { $_.ScheduleInfo -eq $null }

$standing | Format-Table
