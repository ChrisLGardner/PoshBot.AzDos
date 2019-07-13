function AddVSTeamRelease {
    [PoshBot.BotCommand(Aliases = ('AddTeamRelease','QueueRelease'),
                        Permissions = 'QueueRelease')]
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ById', Mandatory=$true)]
    [int]
    ${DefinitionId},

    [string]
    ${Description},

    [Parameter(ParameterSetName='ById', Mandatory=$true)]
    [string]
    ${ArtifactAlias},

    [string]
    ${Name},

    [Parameter(ParameterSetName='ById', Mandatory=$true)]
    [string]
    ${BuildId},

    [string]
    ${SourceBranch},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamRelease', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamRelease
.ForwardHelpCategory Function

#>

}  


