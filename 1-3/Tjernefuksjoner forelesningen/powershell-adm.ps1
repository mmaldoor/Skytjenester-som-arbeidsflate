Find-Module -Name AzureAD | Install-Module
Import-Module AzureAD
Connect-AzureAD

Find-Module -Name MSOnline | Install-Module
Import-Module MSOnline
Connect-MsolService

get-command -module MSOnline
get-command -module AzureAD

get-msolUser
get-help new-MsolUser -Examples

New-MsolUser `
    -UserPrincipalName "ffs@gorlami.onmicrosoft.com" `
    -DisplayName "ffs" `
    -FirstName "ffs" `
    -LastName "tafi"

get-help new-MsolGroup -Examples

New-MsolGroup -DisplayName "m365_pswd_reset" -Description "gruppe brukt til self service psd reset"
Get-MsolGroup

Get-MsolUser 
Get-MsolUser | Select-Object ObjectID, UserPrincipalName
Get-Help Add-MsolGroupMember -Examples

Add-MsolGroupMember `
    -groupObjectid "1e30477c-f1f4-4e80-b050-c60c4fab77c8" `
    -groupmemberType "User" `
    -groupMemberObjectId "65facba5-dd7b-408c-9779-5b76268137ed" 

Get-MsolGroupMember -GroupObjectId "1e30477c-f1f4-4e80-b050-c60c4fab77c8"

#Legg til flere brukere i en gruppe ved bruk av en ForEach løkke
Get-MsolUser | Select-Object ObjectID, UserPrincipalName
$users = Get-MsolUser | Select-Object ObjectID, UserPrincipalName
foreach ($user in $users) {
Add-MsolGroupMember -GroupObjectId "1e30477c-f1f4-4e80-b050-c60c4fab77c8" `
    -groupmemberType "User" `
    -GroupMemberObjectId $user.ObjectID
}

Remove-MsolGroup -ObjectId "1e30477c-f1f4-4e80-b050-c60c4fab77c8"


# Opprett gruppe for testing med selv-service reset passord med AzureAD-modulen
Get-Help New-AzureADGroup -Examples
New-AzureADGroup -DisplayName "m365_pswd_reset" -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"
Get-AzureAdGroup

Get-AzureADUser 
Get-Help Add-AzureADGroupMember -Examples
Add-AzureADGroupMember -ObjectID "" -RefObjectId ""
Get-AzureADGroupMember -ObjectID ""

$users = Get-AzureADUser | Select-Object ObjectID, UserPrincipalName
foreach ($user in $users) {
Add-AzureADGroupMember -ObjectID "8b4658b3-5bea-4543-86c6-09e86d0d5d42" -RefObjectId $user.ObjectID
}

Get-AzureADGroupMember -ObjectID "8b4658b3-5bea-4543-86c6-09e86d0d5d42"


# Opprette ny bruker
Get-Help New-AzureADUser -Examples


Get-AzureADUser -SearchString ""


# Legg til flere brukere via .csv fil
$myusers=Import-Csv my-users.csv -Delimiter ";"
write-host $myusers

foreach ($user in $myusers) {
    $PasswordProfile=New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password=$user.Password
    New-AzureADUser `
        -GivenName $user.GivenName `
        -SurName $user.SurName `
        -DisplayName $user.DisplayName `
        -UserPrincipalName $user.UserPrincipalName `
        -MailNickName $user.MailNickName `
        -OtherMails $user.Altmailaddr `
        -PasswordProfile $PasswordProfile `
        -AccountEnabled $true
}

# Rydde opp etter testing
Get-AzureADUser -SearchString "kari"
Remove-AzureADUser -ObjectId "ab33979b-0072-41ab-a88d-5484778fb27c"
Get-AzureAdGroup
Remove-AzureADGroup -ObjectID ""

