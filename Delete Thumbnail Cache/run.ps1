Write-Host "[i] Clearing Explorer thumbnail cache" -ForegroundColor Cyan
Remove-Item "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache*" -Force -Recurse
