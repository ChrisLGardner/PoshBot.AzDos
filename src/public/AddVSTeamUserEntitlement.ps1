function AddVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('AddTeamUserEntitlement'),
                        Permissions = 'ManageUsers')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [Alias('UserEmail')]
    [string]
    ${Email},

    [Parameter(Position=1)]
    [ValidateSet('Advanced','EarlyAdopter','Express','None','Professional','StakeHolder')]
    [string]
    ${License},

    [Parameter(Position=2)]
    [ValidateSet('Custom','ProjectAdministrator','ProjectContributor','ProjectReader','ProjectStakeholder')]
    [string]
    ${Group})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  


