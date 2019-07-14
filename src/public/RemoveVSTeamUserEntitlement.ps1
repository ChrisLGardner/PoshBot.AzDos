function RemoveVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamUserEntitlement'),
                        Permissions = 'ManageUsers')]
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess=$true, ConfirmImpact='High')]
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

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  



