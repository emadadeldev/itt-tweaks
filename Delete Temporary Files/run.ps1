Write-Host "[i] Cleaning C:\Windows\Temp" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Windows\Temp" *.* -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Write-Host "[i] Cleaning $env:TEMP" -ForegroundColor Cyan
Get-ChildItem -Path $env:TEMP *.* -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
