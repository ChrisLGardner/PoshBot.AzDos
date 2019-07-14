function GetVSTeam {
    [PoshBot.BotCommand(Aliases = ('GetTeam'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Skip},

    [Parameter(ParameterSetName='ByID')]
    [Alias('TeamId')]
    [string[]]
    ${Id},

    [Parameter(ParameterSetName='ByName')]
    [Alias('TeamName')]
    [string[]]
    ${Name})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeam', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters | Select-Object -Property Name,Description,ProjectName

        New-PoshBotCardResponse -Type Normal -Title 'Teams' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeam
.ForwardHelpCategory Function

#>

}  



