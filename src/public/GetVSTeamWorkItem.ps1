function GetVSTeamWorkItem {
    [PoshBot.BotCommand(Aliases = ('GetTeamWorkItem'))]
    [CmdletBinding(DefaultParameterSetName='ByID')]
param(
    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [int]
    ${Id},

    [Parameter(ParameterSetName='List', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [int[]]
    ${Ids},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('Fail','Omit')]
    [string]
    ${ErrorPolicy},

    [ValidateSet('None','Relations','Fields','Links','All')]
    [string]
    ${Expand},

    [string[]]
    ${Fields})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamWorkItem', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamWorkItem
.ForwardHelpCategory Function

#>

}  
