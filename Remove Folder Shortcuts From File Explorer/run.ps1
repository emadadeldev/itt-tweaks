$Registry = @(
    # Keys to be deleted
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}"; Remove = $true }
    @{ Path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}"; Remove = $true }

    # Keys to be set
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"; Name = "HubMode"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"; Name = "System.IsPinnedToNameSpaceTree"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"; Name = "System.IsPinnedToNameSpaceTree"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}"; Name = "System.IsPinnedToNameSpaceTree"; Type = "DWord"; Value = 0 }
)

try {
    foreach ($Item in $Registry) {
        if ($Item.Remove -eq $true) {
            if (Test-Path $Item.Path) {
                Remove-Item -Path $Item.Path -Force -Recurse
                Write-Host "[i] Removed $($Item.Path)" -ForegroundColor Cyan
            } else {
                Write-Host "[i] Not Found (Already Removed) $($Item.Path)" -ForegroundColor Cyan
            }
        } else {
            if (-not (Test-Path $Item.Path)) {
                New-Item -Path $Item.Path -Force | Out-Null
            }

            New-ItemProperty -Path $Item.Path -Name $Item.Name -PropertyType $Item.Type -Value $Item.Value -Force | Out-Null
            Write-Host "[i] Set $($Item.Path)\$($Item.Name) = $($Item.Value)" -ForegroundColor Cyan
        }
    }
} catch {
    Write-Host "[!] Error: $_"
}
