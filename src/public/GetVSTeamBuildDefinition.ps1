function GetVSTeamBuildDefinition {
    [PoshBot.BotCommand(Aliases = ('GetTeamBuildDefinition'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [string]
    ${Filter},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('build','xaml','All')]
    [string]
    ${Type},

    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true, Position=0)]
    [Alias('BuildDefinitionID')]
    [int[]]
    ${Id},

    [Parameter(ParameterSetName='ByID')]
    [Parameter(ParameterSetName='ByIdJson')]
    [Parameter(ParameterSetName='ByIdRaw')]
    [int]
    ${Revision},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamBuildDefinition', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamBuildDefinition
.ForwardHelpCategory Function

#>

}  
