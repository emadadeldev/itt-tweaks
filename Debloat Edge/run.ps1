# EdgeUpdate Policy
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "CreateDesktopShortcutDefault" -Value 0 -Type DWord -Force

# Edge Policies
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "PersonalizationReportingEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "ShowRecommendationsEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "HideFirstRunExperience" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "UserFeedbackAllowed" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "ConfigureDoNotTrack" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "AlternateErrorPagesEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "EdgeCollectionsEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "EdgeShoppingAssistantEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "MicrosoftEdgeInsiderPromotionEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "ShowMicrosoftRewards" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "WebWidgetAllowed" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "DiagnosticData" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "EdgeAssetDeliveryServiceEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "CryptoWalletEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "WalletDonationEnabled" -Value 0 -Type DWord -Force
