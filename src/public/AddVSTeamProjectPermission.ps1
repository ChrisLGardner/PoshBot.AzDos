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

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamProjectPermission', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamProjectPermission
.ForwardHelpCategory Function

#>

}  


