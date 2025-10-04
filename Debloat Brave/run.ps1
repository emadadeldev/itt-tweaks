$registryPath = "HKLM:\SOFTWARE\Policies\BraveSoftware\Brave"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "BraveRewardsDisabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "BraveWalletDisabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "BraveVPNDisabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "BraveAIChatEnabled" -Value 0 -Type DWord -Force
