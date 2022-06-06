Clear-Host

Set-Location c:\

Add-DhcpServerv4Scope -Name "koe1.global" `
-ComputerName "srv01" `
-Description "IP-Bereich für die Verteilung" `
-StartRange "192.168.0.1" `
-EndRange "192.168.0.254" `
-SubNetMask "255.255.255.0" `
-State Active `
-Type DHCP `
-PassThru

Get-DhcpServerv4Scope