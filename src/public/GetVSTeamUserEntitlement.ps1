function GetVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('GetTeamUserEntitlement'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Skip},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('Projects','Extensions','Grouprules')]
    [string[]]
    ${Select},

    [Parameter(ParameterSetName='ByID')]
    [Alias('UserId')]
    [string[]]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'user Entitlements' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  



