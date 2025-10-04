$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "RealTimeIsUniversal" -Value 1 -Type DWord -Force
