function AddVSTeamGitRepository {
    [PoshBot.BotCommand(Aliases = ('AddTeamGitRepository'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${Name})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamGitRepository', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamGitRepository
.ForwardHelpCategory Function

#>

}  


