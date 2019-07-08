function AddVSTeamWorkItemIterationPermission {
    [PoshBot.BotCommand(Aliases = ('AddTeamWorkItemIterationPermission'))]
    [CmdletBinding(DefaultParameterSetName='ByProjectAndIterationIdAndUser')]
param(
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndDescriptor', Mandatory=$true)]
    [string]
    ${Project},

    [Parameter(ParameterSetName='ByProjectAndIterationIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndDescriptor', Mandatory=$true)]
    [int]
    ${IterationID},

    [Parameter(ParameterSetName='ByProjectAndIterationPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndDescriptor', Mandatory=$true)]
    [string]
    ${IterationPath},

    [Parameter(ParameterSetName='ByProjectAndIterationPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndDescriptor', Mandatory=$true)]
    [string]
    ${Descriptor},

    [Parameter(ParameterSetName='ByProjectAndIterationPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndGroup', Mandatory=$true)]
    [string]
    ${Group},

    [Parameter(ParameterSetName='ByProjectAndIterationIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndUser', Mandatory=$true)]
    [string]
    ${User},

    [Parameter(ParameterSetName='ByProjectAndIterationPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndDescriptor', Mandatory=$true)]
    [string]
    ${Allow},

    [Parameter(ParameterSetName='ByProjectAndIterationPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndIterationIdAndDescriptor', Mandatory=$true)]
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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamWorkItemIterationPermission', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamWorkItemIterationPermission
.ForwardHelpCategory Function

#>

}  
