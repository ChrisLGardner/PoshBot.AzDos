function AddVSTeamProjectPermission {
    [PoshBot.BotCommand(Aliases = ('AddTeamProjectPermission'))]
    [CmdletBinding(DefaultParameterSetName='ByProjectAndUser')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Project},

    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Descriptor},

    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [string]
    ${Group},

    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [string]
    ${User},

    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Allow},

    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Deny})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamProjectPermission', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamProjectPermission
.ForwardHelpCategory Function

#>

}  
