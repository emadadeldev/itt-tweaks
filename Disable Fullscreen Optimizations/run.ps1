$registryPath = "HKCU:\System\GameConfigStore"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Value 1 -Type DWord
