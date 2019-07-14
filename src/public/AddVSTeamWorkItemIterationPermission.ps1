function AddVSTeamWorkItemIterationPermission {
    [PoshBot.BotCommand(Aliases = ('AddTeamWorkItemIterationPermission'),
                        Permissions = 'ManageWorkItem')]
    [CmdletBinding(DefaultParameterSetName='ByProjectAndIterationIdAndUser')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
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

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamWorkItemIterationPermission', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamWorkItemIterationPermission
.ForwardHelpCategory Function

#>

}  



