function GetVSTeamProject {
    [PoshBot.BotCommand(Aliases = ('GetTeamProject'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [Parameter(ParameterSetName='List')]
    [ValidateSet('WellFormed','CreatePending','Deleting','New','All')]
    [string]
    ${StateFilter},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Skip},

    [Parameter(ParameterSetName='ByID')]
    [Alias('ProjectID')]
    [string]
    ${Id},

    [switch]
    ${IncludeCapabilities})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamProject', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamProject
.ForwardHelpCategory Function

#>

}  
