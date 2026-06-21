<#
.SYNOPSIS
    Audits device compliance.

.DESCRIPTION
    Retrieves Intune-managed devices and compliance states.

.REQUIREMENTS
    - DeviceManagementManagedDevices.Read.All
#>

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$devices = Get-MgDeviceManagementManagedDevice -All

$devices | Select DeviceName, UserPrincipalName, ComplianceState
