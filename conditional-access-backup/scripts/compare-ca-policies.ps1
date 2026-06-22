$old = Get-Content "./backup-old.json" | ConvertFrom-Json
$new = Get-Content "./backup-new.json" | ConvertFrom-Json

Compare-Object $old $new -Property displayName, state, conditions, grantControls
