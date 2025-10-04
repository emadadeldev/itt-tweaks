$registryPath = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord

$registryPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "ShowCopilotButton" -Value 0 -Type DWord

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "HubsSidebarEnabled" -Value 0 -Type DWord

$registryPath = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord
