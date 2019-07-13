function GetVSTeamSecurityNamespace {
    [PoshBot.BotCommand(Aliases = ('GetTeamSecurityNamespace'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByNamespaceName', Mandatory=$true)]
    [string]
    ${Name},

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
    ${Id},

    [Parameter(ParameterSetName='List')]
    [switch]
    ${LocalOnly})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamSecurityNamespace', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamSecurityNamespace
.ForwardHelpCategory Function

#>

}  


