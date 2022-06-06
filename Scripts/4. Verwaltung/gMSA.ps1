Clear-Host

Set-Location c:\

Add-KdsRootKey -EffectiveImmediately


Add-KdsRootKey -EffectiveTime ((Get-Date).AddHours(-10)) 


New-ADGroup -Name TestMSA `
-GroupScope DomainLocal `
-Description "Gruppe fuer Server von TestMSA" `
-DisplayName "Test gMSA Gruppe" `
-GroupCategory Security `
-SAMAccountName TestMSA `
-PassThru

Add-ADGroupMember -Identity TestMSA `
-Members "koe1dcw01$","koe1dcw02$" `
-PassThru

Get-ADGroupMember -Identity TestMSA

New-ADServiceAccount -Name SvcAcnt1 `
-DNSHostName SvcAcnt1.koe1.global `
-PassThru

Set-ADServiceAccount -Identity SvcAcnt1 `
-PrincipalsAllowedToRetrieveManagedPassword TestMSA `
-PrincipalsAllowedToDelegateToAccount TestMSA `
-PassThru

Invoke-Command -ComputerName koe1dcw02 -ScriptBlock {Restart-Computer -Force}

Invoke-Command -ComputerName koe1dcw02 -ScriptBlock {Install-ADServiceAccount -Identity SvcAcnt1}

Invoke-Command -ComputerName koe1dcw02 -ScriptBlock {Test-ADServiceAccount -Identity SvcAcnt1}


#Jetzt können wir in den Diensten diesen Account für einen spezifischen Dienst auswählen