if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Add-MpPreference -ExclusionPath "C:\Users\$env:UserName\Downloads"
start https://github.com/FaserF/FaserFQuickTools/releases/download/1.0/WindowsPostInstaller.exe
Start-Sleep -s 10
Start-Process C:\Users\$env:UserName\Downloads\WindowsPostInstaller.exe -NoNewWindow -Wait
Remove-MpPreference -ExclusionPath "C:\Users\$env:UserName\Downloads"
pause