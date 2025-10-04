$registryPath = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "EnableMtcUvc" -Value 0 -Type DWord
