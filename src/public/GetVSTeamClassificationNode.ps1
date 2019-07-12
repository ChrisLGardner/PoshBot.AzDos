function GetVSTeamClassificationNode {
    [PoshBot.BotCommand(Aliases = ('GetTeamClassificationNode'))]
    [CmdletBinding(DefaultParameterSetName='ByIds')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ByPath', Mandatory=$true)]
    [ValidateSet('areas','iterations')]
    [string]
    ${StructureGroup},

    [Parameter(ParameterSetName='ByPath')]
    [string]
    ${Path},

    [Parameter(ParameterSetName='ByIds')]
    [int[]]
    ${Ids},

    [Parameter(ParameterSetName='ByIds')]
    [Parameter(ParameterSetName='ByPath')]
    [int]
    ${Depth})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamClassificationNode', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamClassificationNode
.ForwardHelpCategory Function

#>

}  
