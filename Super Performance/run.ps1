# DragFullWindows
$registryPath = "HKCU:\Control Panel\Desktop"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - DragFullWindows" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DragFullWindows" -Value "0" -Type String

# MenuShowDelay
Write-Host "[i] Optimizing $registryPath - MenuShowDelay" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "MenuShowDelay" -Value "200" -Type String

# MinAnimate
$registryPath = "HKCU:\Control Panel\Desktop\WindowMetrics"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - MinAnimate" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "MinAnimate" -Value "0" -Type String

# KeyboardDelay
$registryPath = "HKCU:\Control Panel\Keyboard"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - KeyboardDelay" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "KeyboardDelay" -Value 0 -Type DWord

# ListviewAlphaSelect / ListviewShadow / TaskbarAnimations / TaskbarMn / TaskbarDa / ShowTaskViewButton
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - ListviewAlphaSelect" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "ListviewAlphaSelect" -Value 0 -Type DWord

Write-Host "[i] Optimizing $registryPath - ListviewShadow" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "ListviewShadow" -Value 0 -Type DWord

Write-Host "[i] Optimizing $registryPath - TaskbarAnimations" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TaskbarAnimations" -Value 0 -Type DWord

Write-Host "[i] Optimizing $registryPath - TaskbarMn" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TaskbarMn" -Value 0 -Type DWord

Write-Host "[i] Optimizing $registryPath - TaskbarDa" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TaskbarDa" -Value 0 -Type DWord

Write-Host "[i] Optimizing $registryPath - ShowTaskViewButton" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "ShowTaskViewButton" -Value 0 -Type DWord

# VisualFXSetting
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - VisualFXSetting" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "VisualFXSetting" -Value 2 -Type DWord

# EnableAeroPeek
$registryPath = "HKCU:\Software\Microsoft\Windows\DWM"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - EnableAeroPeek" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "EnableAeroPeek" -Value 0 -Type DWord

# SearchboxTaskbarMode
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath - SearchboxTaskbarMode" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "SearchboxTaskbarMode" -Value 0 -Type DWord

Write-Host "[i] Restarting explorer." -ForegroundColor Cyan
Stop-Process -processName: Explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -processName: Explorer)) {
    Start-Process explorer.exe
}
