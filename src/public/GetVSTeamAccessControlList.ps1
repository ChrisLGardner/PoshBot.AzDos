function GetVSTeamAccessControlList {
    [PoshBot.BotCommand(Aliases = ('GetTeamAccessControlList'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding(DefaultParameterSetName='ByNamespace')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${SecurityNamespace},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('ID')]
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

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [string]
    ${Token},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [string[]]
    ${Descriptors},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [switch]
    ${IncludeExtendedInfo},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [switch]
    ${Recurse})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamAccessControlList', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamAccessControlList
.ForwardHelpCategory Function

#>

}  


