Connect-MgGraph -Scopes "RoleManagement.Read.Directory"

$eligible = Get-MgRoleManagementDirectoryRoleEligibilityScheduleInstance -All

$eligible | Export-Csv "./pim-eligible.csv" -NoTypeInformation
