$registryPath = "HKLM:\System\CurrentControlSet\Control"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "WaitToKillServiceTimeout" -Value "2000" -Type String

$registryPath = "HKCU:\Control Panel\Desktop"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "WaitToKillAppTimeout" -Value "2000" -Type String
Set-ItemProperty -Path $registryPath -Name "HungAppTimeout" -Value "2000" -Type String
