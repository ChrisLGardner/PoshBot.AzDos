function RemoveVSTeamReleaseDefinition {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamReleaseDefinition'),
                        Permissions = 'ManageRelease')]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [int[]]
    ${Id},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamReleaseDefinition', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Release Definitions' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamReleaseDefinition
.ForwardHelpCategory Function

#>

}  



