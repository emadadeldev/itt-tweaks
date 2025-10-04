$registryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Creating $registryPath" -ForegroundColor Cyan
New-ItemProperty -Path $registryPath -Name "" -Value "" -PropertyType String -Force | Out-Null

$registryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Creating $registryPath" -ForegroundColor Cyan
New-ItemProperty -Path $registryPath -Name "" -Value "" -PropertyType String -Force | Out-Null
