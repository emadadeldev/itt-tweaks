Write-Host "[i] Setting MaxCachedIcons = 4096 (4MB)..." -ForegroundColor Cyan
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name MaxCachedIcons -Value "4096" -Type String
Write-Host "[i] Restarting Explorer." -ForegroundColor Cyan
Stop-Process -processName: explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -processName: Explorer)) {
    Start-Process explorer.exe
}
