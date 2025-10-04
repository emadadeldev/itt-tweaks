Write-Host "[i] Downloading and running Autologon.exe" -ForegroundColor Cyan
curl.exe -ss "https://live.sysinternals.com/Autologon.exe" -o $env:temp\autologin.exe
Start-Process -FilePath "$env:temp\autologin.exe" -ArgumentList "/accepteula" -NoNewWindow -Wait
