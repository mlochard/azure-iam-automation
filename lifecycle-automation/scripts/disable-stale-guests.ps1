Connect-MgGraph -Scopes "User.ReadWrite.All","AuditLog.Read.All"

$threshold = (Get-Date).AddDays(-60)

$guests = Get-MgUser -Filter "userType eq 'Guest'" -All

foreach ($g in $guests) {
    $lastSignIn = (Get-MgAuditLogSignIn -Filter "userId eq '$($g.Id)'" -Top 1).CreatedDateTime
    if ($lastSignIn -lt $threshold) {
        Update-MgUser -UserId $g.Id -AccountEnabled:$false
    }
}
