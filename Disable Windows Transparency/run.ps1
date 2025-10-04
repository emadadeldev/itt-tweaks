$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "EnableTransparency" -Value 0 -Type DWord
Write-Host "[i] Restarting explorer." -ForegroundColor Cyan
Stop-Process -processName: Explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -processName: Explorer)) {
    Start-Process explorer.exe
}
