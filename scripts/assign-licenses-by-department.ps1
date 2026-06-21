Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Get-MgUser -All -Property Department

foreach ($u in $users) {
    switch ($u.Department) {
        "IT" { $sku = "ENTERPRISEPREMIUM" }
        "HR" { $sku = "BUSINESSPREMIUM" }
        default { $sku = "BUSINESSSTANDARD" }
    }

    Set-MgUserLicense -UserId $u.Id -AddLicenses @{SkuId=$sku}
}
