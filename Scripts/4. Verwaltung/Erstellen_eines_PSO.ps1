Clear-Host
Set-Location c:\


New-ADOrganizationalUnit CFO


New-ADGroup -Name "Fuehrungskraefte" `
-GroupScope Universal `
-Description "Fuehrungskraefte von koe1.global" `
-GroupCategory "Security" `
-Path "OU=CFO,DC=koe1,DC=global" `
-SAMAccountName "Fuehrungskraefte" `
-PassThru

New-ADUser -Name "Erika Meister" `
-GivenName "Erika" `
-SurName "Meister" `
-Department "Finance" `
-Description "Chief Financial Officer" `
-ChangePasswordAtLogon $True `
-EmailAddress "Meister@koe1.global" `
-Enabled $True `
-PasswordNeverExpires $False `
-SAMAccountName "Meister" `
-AccountPassword (ConvertTo-SecureString "Starting P@ssw0rd!" `
-AsPlainText `
-Force) `
-Title "Chief Financial Officer" `
-PassThru


Add-ADPrincipalGroupMembership -Identity Meister `
-MemberOf "Fuehrungskraefte" `
-PassThru


New-ADFineGrainedPasswordPolicy `
-Description "Minimum 12 Zeichen fuer alle Fuehrungskraefte." `
-LockoutDuration 00:10:00 `
-LockoutObservationWindow 00:10:00 `
-LockoutThreshold 5 `
-MaxPasswordAge 65.00:00:00 `
-MinPasswordLength 12 `
-Name:"Fuehrungskraefte Pwd Policy" `
-Precedence 10 `
-PassThru


Get-ADGroup -Identity "Fuehrungskraefte" `
| Add-ADFineGrainedPasswordPolicySubject `
-Identity "Fuehrungskraefte Pwd Policy"


Get-ADFineGrainedPasswordPolicySubject -Identity "Fuehrungskraefte Pwd Policy"