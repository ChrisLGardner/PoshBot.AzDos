function AddVSTeam {
    [PoshBot.BotCommand(Aliases = ('AddTeam'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=1)]
    [Alias('TeamName')]
    [string]
    ${Name},

    [string]
    ${Description})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeam', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeam
.ForwardHelpCategory Function

#>

}  


