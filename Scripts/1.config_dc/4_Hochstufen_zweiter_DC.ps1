Clear-Host
Set-Location c:\

#Testen ob die Dömain erreichbar ist
Ping <domainName>

#Computer der Damin hinzufügen
Add-Computer -DomainName <domainName> -Restart

Enter-PSSession -ComputerName DC02

#Sie wissen nicht mehr wie das Modul heisst?
Get-WindowsFeature `
| Where-Object {$_.DisplayName -match "Active" `
-AND $_.InstallState -eq "Available" } `
| Format-Table -Auto DisplayName,Name,InstallState



#Mit diesem Befehl installiere ich das AD-Domain-Services Modul
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

$pwdSS = ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force

#Ich installiere nun den DC in die bestehende Gesamtstruktur/Domäne
Install-ADDSDomainController `
-Credential (Get-Credential "domain\administrator") `
-SkipPreChecks `
-SafeModeAdministratorPassword $pwdSS `
-NoGlobalCatalog:$false `
-CreateDnsDelegation:$false `
-CriticalReplicationOnly:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainName "domain.global" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true