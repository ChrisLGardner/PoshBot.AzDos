function InvokeVSTeamRequest {
    [PoshBot.BotCommand(Aliases = ('InvokeTeamRequest'))]
    [CmdletBinding()]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Position=0)]
    [string]
    ${resource},

    [Parameter(Position=1)]
    [string]
    ${area},

    [Parameter(Position=2)]
    [string]
    ${id},

    [Parameter(Position=3)]
    [string]
    ${version},

    [Parameter(Position=4)]
    [string]
    ${subDomain},

    [Parameter(Position=5)]
    [ValidateSet('Get','Post','Patch','Delete','Options','Put','Default','Head','Merge','Trace')]
    [string]
    ${method},

    [Parameter(Position=6, ValueFromPipeline=$true)]
    [System.Object]
    ${body},

    [Parameter(Position=7)]
    [string]
    ${InFile},

    [Parameter(Position=8)]
    [string]
    ${OutFile},

    [switch]
    ${JSON},

    [Parameter(Position=9)]
    [string]
    ${ContentType},

    [Parameter(Position=10)]
    [string]
    ${Url})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Invoke-VSTeamRequest', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Invoke-VSTeamRequest
.ForwardHelpCategory Function

#>

}  
