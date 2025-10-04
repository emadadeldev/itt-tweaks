$registryPath = "HKLM:\Software\NVIDIA Corporation\Global\NvCplApi\Policies"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "PowerMizerEnable" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "PowerMizerLevel" -Value 0 -Type DWord
Set-ItemProperty -Path $registryPath -Name "PowerMizerLevelAC" -Value 0 -Type DWord
