function GetVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('GetTeamUserEntitlement'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Skip},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('Projects','Extensions','Grouprules')]
    [string[]]
    ${Select},

    [Parameter(ParameterSetName='ByID')]
    [Alias('UserId')]
    [string[]]
    ${Id})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  
