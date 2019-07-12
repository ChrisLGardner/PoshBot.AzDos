function GetVSTeamGroup {
    [PoshBot.BotCommand(Aliases = ('GetTeamGroup'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ListByProjectName')]
    [Parameter(ParameterSetName='List')]
    [ValidateSet('vssgp','aadgp')]
    [string[]]
    ${SubjectTypes},

    [Parameter(ParameterSetName='List')]
    [string]
    ${ScopeDescriptor},

    [Parameter(ParameterSetName='ByGroupDescriptor', Mandatory=$true)]
    [Alias('GroupDescriptor')]
    [string]
    ${Descriptor})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamGroup', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamGroup
.ForwardHelpCategory Function

#>

}  
