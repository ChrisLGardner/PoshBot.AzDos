function AddVSTeamWorkItemAreaPermission {
    [PoshBot.BotCommand(Aliases = ('AddTeamWorkItemAreaPermission'))]
    [CmdletBinding(DefaultParameterSetName='ByProjectAndAreaIdAndUser')]
param(
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndDescriptor', Mandatory=$true)]
    [string]
    ${Project},

    [Parameter(ParameterSetName='ByProjectAndAreaIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndDescriptor', Mandatory=$true)]
    [int]
    ${AreaID},

    [Parameter(ParameterSetName='ByProjectAndAreaPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndDescriptor', Mandatory=$true)]
    [string]
    ${AreaPath},

    [Parameter(ParameterSetName='ByProjectAndAreaPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndDescriptor', Mandatory=$true)]
    [string]
    ${Descriptor},

    [Parameter(ParameterSetName='ByProjectAndAreaPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndGroup', Mandatory=$true)]
    [string]
    ${Group},

    [Parameter(ParameterSetName='ByProjectAndAreaIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndUser', Mandatory=$true)]
    [string]
    ${User},

    [Parameter(ParameterSetName='ByProjectAndAreaPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndDescriptor', Mandatory=$true)]
    [string]
    ${Allow},

    [Parameter(ParameterSetName='ByProjectAndAreaPathAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaPathAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndAreaIdAndDescriptor', Mandatory=$true)]
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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamWorkItemAreaPermission', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamWorkItemAreaPermission
.ForwardHelpCategory Function

#>

}  
