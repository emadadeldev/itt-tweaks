$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "1" -Value 1 -Type DWord

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}"
if (Test-Path $registryPath) {
    Write-Host "[i] Removing $registryPath" -ForegroundColor Cyan
    Remove-Item -Path $registryPath -Recurse -Force
}

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}"
if (Test-Path $registryPath) {
    Write-Host "[i] Removing $registryPath" -ForegroundColor Cyan
    Remove-Item -Path $registryPath -Recurse -Force
}
