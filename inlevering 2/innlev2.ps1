Get-Module MicrosoftTeams
Install-Module MicrosoftTeams -Force

Find-Module -Name ExchangeOnlineManagement | Install-Module
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline


Connect-MicrosoftTeams
Get-Team | Select-Object DisplayName,description,GroupId

Install-Module Microsoft.Graph -Scope AllUsers

Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All,Policy.Read.All, Policy.ReadWrite.Authorization, Policy.ReadWrite.AuthenticationFlows, UserAuthenticationMethod.Read.All, RoleManagement.ReadWrite.Directory, GroupMember.ReadWrite.All"


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

        MailEnabled = $True
        MailNickName = $group.MailNickName 
        SecurityEnabled = $True

        Visibility = "private"

        # The beneathe settings will only be applied on dynamic groups (No need for if logic)

        MembershipRuleProcessingState ='On' 
        MembershipRule = if ($group.displayname -match "Alleansatte") {
            "(user.UserType -eq `"$alleansatte`" )"
        } else {
            "(user.Department -eq `"$dep`")"
        } 
     } | New-MgGroup
}


<# Give licenses#>

$gp = Get-MgGroup 

$sku = Get-MgSubscribedSku -All | where {$_.SkuPartNumber -eq "DEVELOPERPACK_E5"}

foreach ($group in $gp) {
Set-MgGroupLicense -GroupId $group.id -AddLicenses @{SkuId = $sku.SkuId} -RemoveLicenses @()

}


<# Making Teams for each group #>

$groups = Get-MgGroup 

foreach ($group in $groups){
    $id = $group.id
    New-Team -GroupId $id
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



New-Team -DisplayName "PowerShell Team" -Description "New Team for Powershell Team"  -Visibility Private

set-unifiedgroup -identity 'PowerShell Team' -HiddenFromAddressListsEnabled:$false -HiddenFromExchangeClientsEnabled:$false 

get-team | where {$_.displayname -match 'PowerShell Team' } | remove-team



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


$rm = get-mguser | where {$_.GivenName -eq "Ola" -Or $_.GivenName -eq "kari"} 

foreach ($group in $rm) {
    Remove-MgUser -UserId $group.id

}



$groups = Get-MgGroup | Where-Object {$_.DisplayName -match "CyberDyne"}

Foreach ($group in $groups) {
    $department = $group.DisplayName
    $member = "Member"
    @{
        GroupID = $group.Id 
        GroupTypes = @('Unified', 'DynamicMembership')
        SecurityEnabled = $true
        MembershipRuleProcessingState='On'
        MembershipRule = if ($group.DisplayName -eq "Alle-ansatte-CyberDyne") {
            "user.usertype -eq `"$member`""
        } else {
            "user.department -eq "$department""
        }
    } | Update-MgGroup

    Update-MgGroup -GroupID $group.Id -GroupTypes @('Unified', 'DynamicMembership') -SecurityEnabled -MembershipRuleProcessingState 'On' -MembershipRule if ($group.DisplayName -eq "Alle-ansatte-CyberDyne") {"user.usertype -eq `"$member`""} else {"user.department -eq "$department""}
}

$groups = Get-MgGroup

foreach ($group in $groups) {
    
    if ($group.DisplayName -match "Alleansatte") {
    Write-Output $group.DisplayName
    }

}
