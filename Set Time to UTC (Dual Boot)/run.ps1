$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
New-ItemProperty -Path $registryPath -Name "RealTimeIsUniversal" -Value 1 -PropertyType DWord -Force
