function GetVSTeamExtension {
    [PoshBot.BotCommand(Aliases = ('GetTeamExtension'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='List')]
    [switch]
    ${IncludeInstallationIssues},

    [Parameter(ParameterSetName='List')]
    [switch]
    ${IncludeDisabledExtensions},

    [Parameter(ParameterSetName='List')]
    [switch]
    ${IncludeErrors},

    [Parameter(ParameterSetName='GetById', Mandatory=$true)]
    [string]
    ${PublisherId},

    [Parameter(ParameterSetName='GetById', Mandatory=$true)]
    [string]
    ${ExtensionId})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamExtension', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamExtension
.ForwardHelpCategory Function

#>

}  
