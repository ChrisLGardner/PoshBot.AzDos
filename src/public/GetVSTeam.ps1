function GetVSTeam {
    [PoshBot.BotCommand(Aliases = ('GetTeam'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
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

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeam', [System.Management.Automation.CommandTypes]::Function)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#

.ForwardHelpTargetName Get-VSTeam
.ForwardHelpCategory Function

#>

}  
