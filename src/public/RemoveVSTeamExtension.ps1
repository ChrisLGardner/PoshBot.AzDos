function RemoveVSTeamExtension {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamExtension'),
                        Permissions = 'ManageExtension')]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${PublisherId},

    [Parameter(Mandatory=$true, Position=1)]
    [string]
    ${ExtensionId},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamExtension', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Extensions' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamExtension
.ForwardHelpCategory Function

#>

}  



