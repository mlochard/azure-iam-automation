Connect-MgGraph -Scopes "AuditLog.Read.All"

$logins = Get-MgAuditLogSignIn -All

$grouped = $logins | Group-Object UserPrincipalName

foreach ($g in $grouped) {
    $sorted = $g.Group | Sort-Object CreatedDateTime
    for ($i = 0; $i -lt $sorted.Count - 1; $i++) {
        $loc1 = $sorted[$i].Location.City
        $loc2 = $sorted[$i+1].Location.City
        if ($loc1 -ne $loc2) {
            Write-Output "$($g.Name) traveled from $loc1 to $loc2"
        }
    }
}
