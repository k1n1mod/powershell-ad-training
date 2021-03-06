Clear-Host
Set-Location c:\

Get-WindowsFeature -Name *Domain*

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

# oder

if ( (Get-WindowsFeature -Name AD-Domain-Services).InstallState -ne "Installed" ) {
  Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature
} 

$pwdSS = ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force

Import-Module ADDSDeployment

Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "domain.global" `
-DomainNetbiosName "KOE1" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-SafeModeAdministratorPassword $pwdSS `
-SkipPreChecks `
-Force:$true

# https://docs.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=win10-ps

#Nachdem die Rolle installiert wird, setzt der Server DNS auf 127.0.0.1 das muss man wieder ändern auf die eigene IP ändern
Set-DnsClientServerAddress `
     -InterfaceAlias "Ethernet0" `
     -ServerAddresses 192.168.136.10

Get-DnsClientServerAddress -InterfaceAlias "Ethernet0"