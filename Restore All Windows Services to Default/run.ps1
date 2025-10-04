Write-Host "[i] Downloading and executing batch script" -ForegroundColor Cyan
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/test.bat' -OutFile "$env:TEMP\script.bat"
Start-Process -FilePath "cmd.exe" -ArgumentList "/c %TMP%\script.bat && del /f /q %TMP%\script.bat" -NoNewWindow -Wait
