Write-Host "[i] Stoping msedge process..." -ForegroundColor Cyan
Get-Process -Name "msedge" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

$RegistryPath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge"
if (Test-Path $RegistryPath) {
    Set-ItemProperty -Path $RegistryPath -Name "NoRemove" -Value 0 -Type DWord -Force
}

Write-Host "[i] Attempting to uninstall Edge..." -ForegroundColor Cyan
$EdgeSetup = Get-ChildItem -Path "C:\Program Files (x86)\Microsoft\Edge\Application\*\Installer\setup.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($EdgeSetup) {
    Start-Process -FilePath $EdgeSetup.FullName -ArgumentList "--uninstall --force-uninstall --system-level" -Wait
}

Write-Host "[i] Deleting Edge Desktop shortcut..." -ForegroundColor Cyan
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$EdgeShortcuts = Get-ChildItem -Path $DesktopPath -Filter "*Edge*.lnk" -ErrorAction SilentlyContinue
foreach ($Shortcut in $EdgeShortcuts) {
    Remove-Item -Path $Shortcut.FullName -Force -ErrorAction SilentlyContinue
}
