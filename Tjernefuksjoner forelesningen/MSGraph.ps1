<#
MSGraph PowerShell v1.0
#>
Install-Module Microsoft.Graph
<# kodesnutter brukt i videoen for Get-MgUser #>
Get-MgUser

Install-Module Microsoft.Graph
Import-Module Microsoft.Graph

Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"
Get-MgUser  | Format-List  ID, DisplayName, Mail, UserPrincipalName
Get-MgUser  | Select-Object  ID, DisplayName, Mail, UserPrincipalName | ft
Get-MgUser -UserID 65facba5-dd7b-408c-9779-5b76268137ed
Get-MgUser -UserID 65facba5-dd7b-408c-9779-5b76268137ed | Format-List 
Get-MgUser -UserID 65facba5-dd7b-408c-9779-5b76268137ed | format-list givenname, surname, UserPrincipalName
$testvariable = Get-MgUser -UserID fec9ff51-f8f0-43ab-9493-5f52dbbe484f | format-list givenname, surname, UserPrincipalName


<# kodesnutter brukt i videoen for New-MgUser #>

$PasswordProfile = @{
    Password = 'xWwvJ]6NMw+bWH-d'
    }  

New-MgUser -DisplayName "Mons Monsen" `
    -UserPrincipalName "Mons.Monsen@demoundervisning.onmicrosoft.com" `
    -PasswordProfile $PasswordProfile `
    -AccountEnabled `
    -MailNickname "Mons.Monsen"


<# kodesnutter brukt i videoen for Update-MgUser #>

Update-MgUser -UserID b5c6e6db-2c3d-4ffc-bc33-8a845dda8ec3 `
    -Department "IT" `
    -Company "Learn IT"




