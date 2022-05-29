#clear consol
Clear-Host
cls

#path
Set-Localtion c:\

#search
Get-Command -Verb Get
Get-Command -Noun Service
Get-Command -Name Clear-Host

#find alias
Get-Alias cls

#inhalt || + alias
Get-Item C:\Windows\
gi C:\Windows\

#set owne alias
Set-Alias -Name geti -Value Get-Item
