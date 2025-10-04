$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableFileSyncNGSC" -Value 1 -Type DWord

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
if (Test-Path $registryPath) {
    Write-Host "[i] Removing OneDrive autorun entry from $registryPath" -ForegroundColor Cyan
    Remove-ItemProperty -Path $registryPath -Name "OneDrive" -ErrorAction SilentlyContinue
}
