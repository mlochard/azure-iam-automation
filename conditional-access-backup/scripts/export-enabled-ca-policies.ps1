Connect-MgGraph -Scopes "Policy.Read.All"

$policies = Get-MgIdentityConditionalAccessPolicy -All | Where-Object { $_.State -eq "enabled" }

$policies | ConvertTo-Json -Depth 10 | Out-File "./EnabledCAPolicies.json"
