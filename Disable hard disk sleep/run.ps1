Write-Host "[i] Disable hard disk sleep..." -ForegroundColor Cyan
powercfg -setacvalueindex SCHEME_CURRENT SUB_DISK DISKIDLE 0
Write-Host "[i] Done."
