function AddVSTeamBuild {
    [PoshBot.BotCommand(Aliases = ('AddTeamBuild'),
                        Permissions = 'ManageBuild')]
    [CmdletBinding(DefaultParameterSetName='ByName')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ByID', ValueFromPipelineByPropertyName=$true)]
    [int]
    ${BuildDefinitionId},

    [string]
    ${SourceBranch},

    [hashtable]
    ${BuildParameters})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamBuild', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamBuild
.ForwardHelpCategory Function

#>

}  


