function AddVSTeamGitRepositoryPermission {
    [PoshBot.BotCommand(Aliases = ('AddTeamGitRepositoryPermission'))]
    [CmdletBinding(DefaultParameterSetName='ByProjectAndUser')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByRepositoryNameAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Project},

    [Parameter(ParameterSetName='ByRepositoryIdAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndGroup', Mandatory=$true)]
    [ValidateScript({ 
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
       })]
    [string]
    ${RepositoryId},

    [Parameter(ParameterSetName='ByRepositoryNameAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndGroup', Mandatory=$true)]
    [string]
    ${RepositoryName},

    [Parameter(ParameterSetName='ByRepositoryNameAndDescriptor')]
    [Parameter(ParameterSetName='ByRepositoryIdAndDescriptor')]
    [Parameter(ParameterSetName='ByRepositoryNameAndUser')]
    [Parameter(ParameterSetName='ByRepositoryNameAndGroup')]
    [Parameter(ParameterSetName='ByRepositoryIdAndUser')]
    [Parameter(ParameterSetName='ByRepositoryIdAndGroup')]
    [string]
    ${BranchName},

    [Parameter(ParameterSetName='ByRepositoryNameAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Descriptor},

    [Parameter(ParameterSetName='ByRepositoryNameAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [string]
    ${Group},

    [Parameter(ParameterSetName='ByRepositoryNameAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [string]
    ${User},

    [Parameter(ParameterSetName='ByRepositoryNameAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Allow},

    [Parameter(ParameterSetName='ByRepositoryNameAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndDescriptor', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryNameAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByRepositoryIdAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndUser', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndGroup', Mandatory=$true)]
    [Parameter(ParameterSetName='ByProjectAndDescriptor', Mandatory=$true)]
    [string]
    ${Deny})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamGitRepositoryPermission', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamGitRepositoryPermission
.ForwardHelpCategory Function

#>

}  


