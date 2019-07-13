function AddVSTeamFeed {
    [PoshBot.BotCommand(Aliases = ('AddTeamFeed'),
                        Permissions = 'ManageArtifacts')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${Name},

    [Parameter(Position=1)]
    [string]
    ${Description},

    [switch]
    ${EnableUpstreamSources},

    [switch]
    ${showDeletedPackageVersions})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamFeed', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamFeed
.ForwardHelpCategory Function

#>

}  


