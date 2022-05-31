Clear-Host

Set-Location c:\

Add-DhcpServerv4ExclusionRange -ScopeID "192.168.0.0" `
-ComputerName "srv01" `
-StartRange "192.168.0.230" `
-EndRange "192.168.0.254" `
-PassThru


Set-DhcpServerv4OptionValue -ScopeID "192.168.0.0" `
-ComputerName "srv01" `
-DnsDomain "koe1.global" `
-DnsServer "192.168.0.10" `
-Router "192.168.0.2" `
-PassThru


Get-DhcpServerv4OptionValue -ScopeId "192.168.0.0"