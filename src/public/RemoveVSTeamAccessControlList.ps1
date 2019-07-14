function RemoveVSTeamAccessControlList {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamAccessControlList'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding(DefaultParameterSetName='ByNamespace', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${SecurityNamespace},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [ValidateScript({ 
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
       })]
    [string]
    ${SecurityNamespaceId},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [string[]]
    ${Tokens},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [switch]
    ${Recurse},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamAccessControlList', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamAccessControlList
.ForwardHelpCategory Function

#>

}  



