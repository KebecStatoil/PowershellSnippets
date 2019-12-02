# Connect-AzAccount

Get-AzKeyVaultSecret ODET2KVDev | ForEach-Object { $_.Name }

$s = Get-AzKeyVaultSecret ODET2KVDev -Name ora-safranproject-p300-dev
$s.SecretValueText
