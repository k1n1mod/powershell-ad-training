Clear-Host

Set-Location c:\

Get-NetAdapter

Get-NetAdapter | Get-Member

#DHCP der Netzwerkschnittstelle deaktivieren
Set-NetIPInterface -InterfaceAlias "Ethernet0" -DHCP Disabled -PassThru

#IP Adresse setzen
New-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet0" -IPAddress 192.168.0.10 -PrefixLength 24 -DefaultGateway 192.168.0.1

#DNS
Set-DnsClientServerAddress `
    -InterfaceAlias "Ethernet0" `
    -ServerAddresses 192.168.0.10

#Überprüfen ob das Interface eine IP-Adresse bekommen hat
Get-NetIPAddress -InterfaceAlias "Ethernet0"

#Überprüfen ob das Interface eine DNS-Adresse bekommen hat
Get-DnsClientServerAddress -InterfaceAlias "Ethernet0"

#ping ps
Test-Connection 8.8.8.8

#Computername setzen
Rename-Computer -NewName KOE1DCW01 -Restart -Force -PassThru