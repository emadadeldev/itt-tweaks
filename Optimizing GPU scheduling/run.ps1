$registryPath = "HKLM:\SOFTWARE\CurrentControlSet\Control\GraphicsDrivers"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "HwSchMode" -Value 1 -Type DWord
