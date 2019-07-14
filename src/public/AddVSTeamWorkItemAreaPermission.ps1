function AddVSTeamWorkItemAreaPermission {
    [PoshBot.BotCommand(Aliases = ('AddTeamWorkItemAreaPermission'),
                        Permissions = 'ManageWorkItem')]
    [CmdletBinding(DefaultParameterSetName='ByProjectAndAreaIdAndUser')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
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

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamWorkItemAreaPermission', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Area Permissions' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamWorkItemAreaPermission
.ForwardHelpCategory Function

#>

}  



