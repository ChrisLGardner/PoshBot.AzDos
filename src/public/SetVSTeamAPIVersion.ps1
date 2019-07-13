function SetVSTeamAPIVersion {
    [PoshBot.BotCommand(Aliases = ('SetTeamAPIVersion'))]
    [CmdletBinding(DefaultParameterSetName='Target', SupportsShouldProcess=$true, ConfirmImpact='Low')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='Target', Position=0)]
    [ValidateSet('TFS2017','TFS2018','VSTS','AzD')]
    [string]
    ${Target},

    [Parameter(ParameterSetName='Service', Mandatory=$true, Position=0)]
    [ValidateSet('Build','Release','Core','Git','DistributedTask','VariableGroups','Tfvc','Packaging','MemberEntitlementManagement','ExtensionsManagement','ServiceFabricEndpoint','Graph')]
    [string]
    ${Service},

    [Parameter(ParameterSetName='Service', Mandatory=$true, Position=1)]
    [string]
    ${Version},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamAPIVersion', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Set-VSTeamAPIVersion
.ForwardHelpCategory Function

#>

}  


