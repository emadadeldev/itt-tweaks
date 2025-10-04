$registryPath = "HKLM:\System\CurrentControlSet\Control\Session Manager\Memory Management"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "LargeSystemCache" -Value 1 -Type DWord
