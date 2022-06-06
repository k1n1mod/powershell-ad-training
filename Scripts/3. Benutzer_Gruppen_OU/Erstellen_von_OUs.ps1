Clear-Host

Set-Location c:\

New-ADOrganizationalUnit -Name "Technik"

Get-ADOrganizationalUnit -Filter *

New-ADOrganizationalUnit -Name "Berlin"

New-ADOrganizationalUnit -Path "OU=Berlin,DC=koe1,DC=global" -Name "Technik"


Get-ADOrganizationalUnit Technik


help Get-ADOrganizationalUnit 
help Get-ADOrganizationalUnit -Parameter identity


Get-ADOrganizationalUnit -Identity "OU=Technik,OU=Berlin,DC=koe1,DC=global"
Get-ADOrganizationalUnit -Identity "OU=Technik,DC=koe1,DC=global"


Remove-ADOrganizationalUnit "Technik" 

Remove-ADOrganizationalUnit "OU=Technik,DC=koe1,DC=global" 

whoami

Get-ADOrganizationalUnit "OU=Technik,DC=koe1,DC=global" -Properties *

Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false -Identity "OU=Technik,DC=koe1,DC=global"

Remove-ADOrganizationalUnit "OU=Technik,DC=koe1,DC=global"

Get-ADOrganizationalUnit -Identity "OU=Technik,DC=koe1,DC=global"