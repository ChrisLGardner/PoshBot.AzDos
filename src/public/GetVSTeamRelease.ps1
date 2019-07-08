function GetVSTeamRelease {
    [PoshBot.BotCommand(Aliases = ('GetTeamRelease'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [ValidateSet('environments','artifacts','approvals','none')]
    [string]
    ${expand},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('Draft','Active','Abandoned')]
    [string]
    ${statusFilter},

    [Parameter(ParameterSetName='List')]
    [int]
    ${definitionId},

    [Parameter(ParameterSetName='List')]
    [int]
    ${top},

    [Parameter(ParameterSetName='List')]
    [string]
    ${createdBy},

    [Parameter(ParameterSetName='List')]
    [datetime]
    ${minCreatedTime},

    [Parameter(ParameterSetName='List')]
    [datetime]
    ${maxCreatedTime},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('ascending','descending')]
    [string]
    ${queryOrder},

    [Parameter(ParameterSetName='List')]
    [string]
    ${continuationToken},

    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true, Position=0)]
    [Alias('ReleaseID')]
    [int[]]
    ${id},

    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true)]
    [switch]
    ${JSON},

    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true)]
    [switch]
    ${raw})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamRelease', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamRelease
.ForwardHelpCategory Function

#>

}  
