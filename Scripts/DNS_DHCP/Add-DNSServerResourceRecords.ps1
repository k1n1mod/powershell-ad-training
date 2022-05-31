Clear-Host

Set-Location c:\

Add-DnsServerResourceRecord -ZoneName "koe1.global" `
-A `
-Name websrv01 `
-IPv4Address 192.168.0.30 `
-CreatePtr `
-PassThru


Add-DnsServerResourceRecord -ZoneName "koe1.global" `
-CName `
-Name wds `
-HostNameAlias wdssrv01.koe1.global `
-PassThru

Get-DnsServerResourceRecord -ZoneName "koe1.global"


Get-DnsServerResourceRecord -ZoneName "koe1.global" | where-Object {$_.recordtype -eq "A"}