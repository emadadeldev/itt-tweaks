$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "AvgCPULoadFactor" -Value 25 -Type DWord
