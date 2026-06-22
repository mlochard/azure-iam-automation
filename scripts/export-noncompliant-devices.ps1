Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$devices = Get-MgDeviceManagementManagedDevice -All

$non = $devices | Where-Object { $_.ComplianceState -ne "compliant" }

$non | Export-Csv "./noncompliant-devices.csv" -NoTypeInformation
