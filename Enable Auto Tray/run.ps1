Write-Host "[i] Enabling all tray icons..." -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name EnableAutoTray -Value 0
Write-Host "[i] Restarting explorer." -ForegroundColor Cyan
Stop-Process -processName: Explorer -Force
