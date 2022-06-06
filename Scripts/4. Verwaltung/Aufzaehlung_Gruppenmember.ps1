Clear-Host
Set-Location c:\


Get-ADGroupMember "Domänen-Admins" | ft name

Get-ADPrincipalGroupMembership frabets | ft name

Get-ADUser -Filter 'memberof -recursivematch "cn=Domänen-Admins,cn=users,dc=koe1,dc=global"' | ft name