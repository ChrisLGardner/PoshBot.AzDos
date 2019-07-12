function SetVSTeamAPIVersion {
    [PoshBot.BotCommand(Aliases = ('SetTeamAPIVersion'))]
    [CmdletBinding(DefaultParameterSetName='Target', SupportsShouldProcess=$true, ConfirmImpact='Low')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='Target', Position=0)]
    [ValidateSet('TFS2017','TFS2018','VSTS','AzD')]
    [string]
    ${Target},

    [Parameter(ParameterSetName='Service', Mandatory=$true, Position=0)]
    [ValidateSet('Build','Release','Core','Git','DistributedTask','VariableGroups','Tfvc','Packaging','MemberEntitlementManagement','ExtensionsManagement','ServiceFabricEndpoint','Graph')]
    [string]
    ${Service},

    [Parameter(ParameterSetName='Service', Mandatory=$true, Position=1)]
    [string]
    ${Version},

    [switch]
    ${Force})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamAPIVersion', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-VSTeamAPIVersion
.ForwardHelpCategory Function

#>

}  
