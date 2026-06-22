<#
.SYNOPSIS
    Detects MFA fatigue attacks.

.DESCRIPTION
    Flags users with repeated MFA denials (error 500121).

.REQUIREMENTS
    - AuditLog.Read.All
#>

Connect-MgGraph -Scopes "AuditLog.Read.All"

$fatigue = Get-MgAuditLogSignIn -Filter "status/errorCode eq 500121" -All |
    Group-Object userPrincipalName |
    Where-Object { $_.Count -gt 5 }

$fatigue
