<#----------------------Setup-------------------------------------#>

Install-Module Microsoft.Graph -Scope AllUsers

Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All,Policy.Read.All, Policy.ReadWrite.Authorization, Policy.ReadWrite.AuthenticationFlows, UserAuthenticationMethod.Read.All, RoleManagement.ReadWrite.Directory, GroupMember.ReadWrite.All"

# Import-Module AzureAD -UseWindowsPowerShell
# Import-Module -Name Az.Resources -UseWindowsPowerShell

<#------------------------------Group config-------------------------------------#>

# Importerer grupper fra Csv og lager de

$Groups=Import-Csv Groups.csv -Delimiter ";"
write-host $groups.GroupTypes


foreach ($group in $Groups) {

    
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

        MailEnabled = $False 
        MailNickName = $group.MailNickName 

        # Make a group rolse assignable if it has true attribute from the csv file

        IsAssignableToRole = if ($group.IsAssignableToRole -eq "false") {
            $False
        } else {
            $True
        }
        SecurityEnabled = $True

        # The beneathe settings will only be applied on dynamic groups (No need for if logic)

        MembershipRuleProcessingState ='On' 
        MembershipRule = "(user.Department -eq `"$dep`")"
     } | New-MgGroup
}


# Adding groups to m365 to give them sspr 

$sspr = Get-MgGroup | where {$_.DisplayName -match "m365_passwd_reset"} 
$groups = Get-MgGroup | where {$_.DisplayName -match "sec"} 

foreach ($group in $Groups) {

    New-MgGroupMember -GroupId $sspr.id -DirectoryObjectId $group.id

}

<#
    msgraph doesnt have the function of adding groups to sspr yet, but this can be done with other modules or manually
#>

# Assignm roles to admin group

<#
    Her gir jeg en rolle som jeg antar at den er mest sannsynlig egnet for dev_admins. Jeg gjør dette for å illustrere prosessen.
#>

$gp = Get-MgGroup | where {$_.DisplayName -match "sec"}
$role = Get-MgRoleManagementDirectoryRoleDefinition | where {$_.DisplayName -eq "Application Developer"}

$params = @{
	"@odata.type" = "#microsoft.graph.unifiedRoleAssignment"
	RoleDefinitionId = $role.Id
	PrincipalId = $gp.id
	DirectoryScopeId = "/"
}

New-MgRoleManagementDirectoryRoleAssignment -BodyParameter $params


# Adding E5 licence groups

$sku = Get-MgSubscribedSku -All | where {$_.SkuPartNumber -eq "DEVELOPERPACK_E5"}

foreach ($group in $gp) {
Set-MgGroupLicense -GroupId $group.id -AddLicenses @{SkuId = $sku.SkuId} -RemoveLicenses @()

}





<#-----------------------------User Config-------------------------------#>

$myusers=Import-Csv Users.csv -Delimiter ";"
write-host $myusers


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
        -BusinessPhones $user.phone
}




# For å rydde opp


$rm = get-mggroup | where {$_.DisplayName -match "Developers" -Or $_.DisplayName -match "HR" -Or "m365_passwd_reset"} 

foreach ($group in $rm) {
    Remove-MgGroup -GroupId $group.id

}


$rm = get-mguser | where {$_.GivenName -eq "Ola" -Or $_.GivenName -eq "kari"} 

foreach ($group in $rm) {
    Remove-MgUser -UserId $group.id

}


