function UpdateVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamUserEntitlement'))]
    [CmdletBinding(DefaultParameterSetName='ByEmail', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserId')]
    [string]
    ${Id},

    [Parameter(ParameterSetName='ByEmail', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserEmail')]
    [string]
    ${Email},

    [Parameter(Mandatory=$true)]
    [ValidateSet('Advanced','EarlyAdopter','Express','None','Professional','StakeHolder')]
    [string]
    ${License},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  


