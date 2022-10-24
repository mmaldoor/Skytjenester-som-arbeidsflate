

Find-Module -Name ExchangeOnlineManagement | Install-Module
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline



Get-Team | Select-Object DisplayName,description,GroupId

Install-Module Microsoft.Graph -Scope AllUsers

Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All,Policy.Read.All, Policy.ReadWrite.Authorization, Policy.ReadWrite.AuthenticationFlows, UserAuthenticationMethod.Read.All, RoleManagement.ReadWrite.Directory, GroupMember.ReadWrite.All"

<#--------- Creating Unified groups ------------#>

$Groups=Import-Csv Groups.csv -Delimiter ";"
write-host $groups


foreach ($group in $Groups) {

    $alleansatte = "Member"
    $dep = $group.DisplayName

     @{
        DisplayName = $group.DisplayName

        GroupTypes = if ($group.GroupTypes -match "DynamicMembership")
        {
            @(  
                $group.GroupTypes.split(",")
            )

           
        } else {
             $null
        }

        MailEnabled = $True    # This will enable a mailbox for each group and it will function as a distribution group. For more info, visit https://learn.microsoft.com/en-us/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide
        MailNickName = $group.MailNickName 
        SecurityEnabled = $True

        Visibility = "private"

        MembershipRuleProcessingState ='On' 
        MembershipRule = if ($group.displayname -match "Alleansatte") {
            "(user.UserType -eq `"$alleansatte`" )"
        } else {
            "(user.Department -eq `"$dep`")"
        } 
     } | New-MgGroup
}


<# Give E5 license for Employes #>

$alleansatte_group = Get-MgGroup | where {$_.DisplayName -eq 'CyberDyne_Alleansatte'}

$sku = Get-MgSubscribedSku -All | where {$_.SkuPartNumber -eq "DEVELOPERPACK_E5"}

Set-MgGroupLicense -GroupId $alleansatte_group.id -AddLicenses @{SkuId = $sku.SkuId} -RemoveLicenses @()


<#------- Making Teams for each group --------#>

Get-Module MicrosoftTeams
Install-Module MicrosoftTeams -Force
Connect-MicrosoftTeams

$groups = Get-MgGroup 

foreach ($group in $groups){
    
    $id = $group.id
    New-Team -GroupId $id -Visibility Private
}

<#---------------- Create Users ---------------------#>

$myusers=Import-Csv Users.csv -Delimiter ";"
write-host $myusers.Usertype


foreach ($user in $myusers) {
    $PasswordProfile = @{
        forceChangePasswordNextSignIn = $true
        forceChangePasswordNextSignInWithMfa = $true   # Forces the user to change password with mfa on first login + filling up neccessary info for MFA loggin methods.
        Password = $user.Password
        }  
        New-MgUser `
        -GivenName $user.GivenName `
        -SurName $user.SurName `
        -DisplayName $user.DisplayName `
        -UserPrincipalName $user.UserPrincipalName `
        -MailNickName $user.MailNickName `
        -OtherMails $user.Altmailaddr `
        -PasswordProfile $PasswordProfile `
        -AccountEnabled  `
        -Department $user.Department `
        -BusinessPhones $user.phone `
        -UserType 'Member'
}




<#-------- Creating rooms ---------#>

Find-Module -Name ExchangeOnlineManagement | Install-Module
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

$Rooms=Import-Csv Rooms.csv -Delimiter ";"

foreach ($room in $Rooms) {

    new-mailbox -Name $room.Name -Office $room.Office -DisplayName $room.Name -Room -ResourceCapacity $room.Capacity
}



<#----- Security -----#>

Connect-ExchangeOnline


# Anti phishing

Get-AntiPhishPolicy -Identity "Office365 AntiPhish Default"

Set-AntiPhishPolicy `
-Identity "Office365 AntiPhish Default" `
-EnableFirstContactSafetyTips $true `
-EnableOrganizationDomainsProtection $true `
-EnableTargetedUserProtection $true `
-PhishThresholdLevel 2 `

# Anti malware

get-MalwareFilterPolicy -Identity Default

Set-MalwareFilterPolicy `
-Identity Default `
-EnableFileFilter $true `
-EnableInternalSenderAdminNotifications $true

# Safe attachment

Get-SafeAttachmentPolicy -Identity 'Built-In Protection Policy'

Set-SafeAttachmentPolicy `
-Identity 'Built-In Protection Policy' `
-Redirect $true `
-RedirectAddress < Specify the admin address to redirect to >

# Anti spam

## Inbound


Get-HostedContentFilterPolicy -identity Default
 

Set-HostedContentFilterPolicy `
-identity Default `
-BulkThreshold 6 `
-HighConfidenceSpamAction Quarantine `
-HighConfidencePhishAction Quarantine `
-PhishSpamAction Quarantine `
-PhishZapEnabled $true
-QuarantineRetentionPeriod 30
-RedirectToRecipients < Specify the email to redirect to >

## Filter

Set-HostedConnectionFilterPolicy "Default" -IPAllowList 192.168.1.10,192.168.1.23 -IPBlockList 10.10.10.0/25 # Bare for å gi et eksempel


## Outbound

Set-HostedOutboundSpamFilterPolicy -Identity Default -RecipientLimitExternalPerHour 500 -RecipientLimitInternalPerHour 1000 -RecipientLimitPerDay 1000 -ActionWhenThresholdReached BlockUser -NotifyOutboundSpam $true -NotifyOutboundSpamRecipients < Specify email >



<#------- Cleaning --------#>

$rm = get-mggroup

$sku = Get-MgSubscribedSku -All | where {$_.SkuPartNumber -eq "DEVELOPERPACK_E5"}

foreach ($group in $rm) {
    Set-MgGroupLicense -GroupId $group.id  -RemoveLicenses @($sku.SkuId) -AddLicenses @{}

}



$rm = get-mggroup 

foreach ($group in $rm) {
    Remove-MgGroup `
    -GroupId if ($group -eq "ffs") {$group.ids} 

}


$rm = get-mguser | where {$_.DisplayName -match 'Nordmann'} 

foreach ($group in $rm) {
    Remove-MgUser -UserId $group.id

}

$rooms = get-mailbox | where {$_.Name -eq 'Tank' -OR $_.Name -eq 'Genisys'}

foreach ($room in $rooms) {
    remove-mailbox -identity $room.Name
}

$groups = Get-MgGroup

foreach ($group in $groups) {
    
    if ($group.DisplayName -match "Alleansatte") {
    Write-Output $group.DisplayName
    }

}
