Clear-Host

Set-Location c:\

Get-Command *org*


help Get-ADObject

Get-ADObject -SearchBase "OU=NewUsers,DC=koe1,DC=global" -Filter *

Get-ADUser -Filter "department -eq 'Technik'"

Get-ADUser -Filter "department -eq 'Technik' -and city -eq 'Berlin'"

Get-ADUser -Filter "department -eq 'Technik' -and city -eq 'Berlin'" -Properties department, city | Select-Object name, city, department

Get-ADUser -Filter "department -eq 'Technik' -and city -eq 'Berlin'" -Properties department, city | Move-ADObject -TargetPath "OU=Technik,OU=Berlin,DC=koe1,DC=global"

Get-ADObject -SearchBase "OU=Technik,OU=Berlin,DC=koe1,DC=global" -Filter *