Clear-Host
Set-Location c:\

Get-Command | where { $_.parameters.keys -contains "ComputerName" -and $_.parameters.keys -notcontains "Session"}

Enter-PSSession -ComputerName koe1dcw01

Exit-PSSession


Invoke-Command -ComputerName koe1dcw01, koe1dcw02 -ScriptBlock {Get-UICulture}


$s = New-PSSession -ComputerName koe1dcw01, koe1dcw02


Invoke-Command -Session $s {$h = Get-HotFix}


Invoke-Command -Session $s {$h | where {$_.InstalledBy -ne "NTAUTHORITY\SYSTEM"}}


Invoke-Command -ComputerName dc02, srv01 -ScriptBlock {Update-Help * -Force}