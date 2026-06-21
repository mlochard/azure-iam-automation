Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$devices = Get-MgDeviceManagementManagedDevice -All

$noBL = $devices | Where-Object { $_.EncryptionState -ne "encrypted" }

$noBL | Format-Table DeviceName, UserPrincipalName, EncryptionState
