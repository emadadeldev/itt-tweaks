Write-Host "[i] Disabling SMB1 and SMB2 protocols" -ForegroundColor Cyan
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force
