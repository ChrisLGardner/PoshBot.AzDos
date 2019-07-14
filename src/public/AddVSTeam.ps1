function AddVSTeam {
    [PoshBot.BotCommand(Aliases = ('AddTeam'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
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
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeam', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters | Select-Object -Property Name,Description,ProjectName

        New-PoshBotCardResponse -Type Normal -Title Team -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeam
.ForwardHelpCategory Function

#>

}  



