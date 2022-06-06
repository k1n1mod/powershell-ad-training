Clear-Host

Set-Location c:\

Get-WindowsFeature -Name *dhcp*

Install-WindowsFeature -ComputerName srv01 `
-Name DHCP `
-IncludeAllSubFeature `
-IncludeManagementTools

Add-DhcpServerInDC -DnsName 'srv01.koe1.global' -PassThru

Get-DhcpServerSetting