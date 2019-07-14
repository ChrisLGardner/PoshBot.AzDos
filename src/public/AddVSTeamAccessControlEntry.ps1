function AddVSTeamAccessControlEntry {
    [PoshBot.BotCommand(Aliases = ('AddTeamAccessControlEntry'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding(DefaultParameterSetName='ByNamespace')]
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
    [string]
    ${Token},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [string]
    ${Descriptor},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [ValidateRange(0, 2147483647)]
    [int]
    ${AllowMask},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [ValidateRange(0, 2147483647)]
    [int]
    ${DenyMask})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamAccessControlEntry', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Team Access Control Entries' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamAccessControlEntry
.ForwardHelpCategory Function

#>

}  



