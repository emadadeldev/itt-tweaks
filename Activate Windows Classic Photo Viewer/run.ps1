$extList = @(
    ".bmp", ".cr2", ".dib", ".gif", ".ico", ".jfif", ".jpe", ".jpeg",
    ".jpg", ".jxr", ".png", ".tif", ".tiff", ".wdp"
)

foreach ($ext in $extList) {
    # Set default association under HKCU\Classes
    New-Item -Path "HKCU:\SOFTWARE\Classes\$ext" -Force | Out-Null
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Classes\$ext" -Name "(default)" -Value "PhotoViewer.FileAssoc.Tiff"

    # Set OpenWithProgids
    $openWithPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\$ext\OpenWithProgids"
    New-Item -Path $openWithPath -Force | Out-Null
    New-ItemProperty -Path $openWithPath -Name "PhotoViewer.FileAssoc.Tiff" -PropertyType Binary -Value ([byte[]]@()) -Force | Out-Null
}

Write-Host " [i] Windows Photo Viewer associations restored!" -ForegroundColor Cyan
