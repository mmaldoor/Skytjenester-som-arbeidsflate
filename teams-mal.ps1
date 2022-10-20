Get-Module MicrosoftTeams
Install-Module MicrosoftTeams -Force

Connect-MicrosoftTeams
Get-Team | Select-Object DisplayName,description,GroupId
Show-Command –name "Get-Team"
Get-Help set-team -Examples

#--- Editere eksisterende Team ---#

Set-Team # lar deg endre innstillingene til et eksisterende team:
Get-help Set-Team -Online # <-- Åpner nettleseren og dokumentasjonssiden til Set-Team
# https://docs.microsoft.com/en-us/powershell/module/teams/set-team?view=teams-ps

$editteam = Get-Team -DisplayName "Prosjekt ny logo"
Set-Team -GroupId $editteam.GroupId -Description "Dette er ny beskrivelse" -Visibility Public -AllowOwnerDeleteMessages $true


#--- Opprette nytt Team ---#

New-Team # Oppretter nytt team
# https://docs.microsoft.com/en-us/powershell/module/teams/new-team?view=teams-ps
get-Help New-Team -Examples

New-Team -DisplayName "PowerShell Team" -Description "New Team for Powershell Team" -Visibility Private

$group = New-Team -MailNickname "DreamTeam" -displayname "Dream Team" -Visibility "Public"
Add-TeamUser -GroupId $group.GroupId -User "Ola.Nordmann@demoundervisning.onmicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "Kari.Nordmann@demoundervisning.onmicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "Per.Person@demoundervisning.onmicrosoft.com"
New-TeamChannel -GroupId $group.GroupId -DisplayName "New Plan"
New-TeamChannel -GroupId $group.GroupId -DisplayName "New Project"
New-TeamChannel -GroupId $group.GroupId -DisplayName "New Investors"


$AllTeams = (Get-Team).GroupID
$TeamList = @()

Foreach ($Team in $AllTeams)
{       
        $TeamGUID = $Team.ToString()
        $TeamName = (Get-Team | ?{$_.GroupID -eq $Team}).DisplayName
        $TeamOwner = (Get-TeamUser -GroupId $Team | ?{$_.Role -eq 'Owner'}).Name
        $TeamMember = (Get-TeamUser -GroupId $Team | ?{$_.Role -eq 'Member'}).Name

        $TeamList = $TeamList + [PSCustomObject]@{TeamName = $TeamName; TeamObjectID = $TeamGUID; TeamOwners = $TeamOwner -join ', '; TeamMembers = $TeamMember -join ', '}
}

$TeamList | export-csv c:\script\TeamsData.csv -NoTypeInformation 


# Lag et nytt Team ved bruk av variabler

$teamName= "My SuperDupre Team"
$teamDescription= "Awesome people for an awesome project"
$teamOwner= "melling@demoundervisning.onmicrosoft.com"
$teamVisibility= "Private"
$teamEditMessagesPolicy= $false
$teamDeliteMessagesPolicy= $false
$teamChannels= @(“FunInTheSun”, “Serious Work”)
$teamMembers= @(“Per.person@demoundervisning.onmicrosoft.com”, “kari.nordmann@demoundervisning.onmicrosoft.com”)
$mailnick = ""

Connect-MicrosoftTeams
$teamDetails=New-Team -DisplayName $teamName -Description $teamDescription -Owner $teamOwner -Visibility $teamVisibility -AllowUserEditMessages $teamEditMessagesPolicy -AllowOwnerDeleteMessages $teamDeliteMessagesPolicy
for ($i=0; $i-lt$teamChannels.length; $i++) {
    New-TeamChannel -GroupId $teamDetails.GroupId -DisplayName $teamChannels[$i]
}
for ($i=0; $i-lt$teamMembers.length; $i++) {
    Add-TeamUser -GroupId $teamDetails.GroupId -User $teamMembers[$i] -role ”Member”
}
Disconnect-MicrosoftTeams
