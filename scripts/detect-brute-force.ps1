Connect-MgGraph -Scopes "AuditLog.Read.All"

$failed = Get-MgAuditLogSignIn -Filter "status/errorCode eq 50126" -All

$grouped = $failed | Group-Object UserPrincipalName | Where-Object { $_.Count -gt 10 }

$grouped | Format-Table
