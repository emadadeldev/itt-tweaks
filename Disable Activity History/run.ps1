$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "EnableActivityFeed" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "PublishUserActivities" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $registryPath -Name "UploadUserActivities" -Value 0 -Type DWord -Force
