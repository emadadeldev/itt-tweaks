$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableWpbtExecution" -Value 1 -Type DWord
