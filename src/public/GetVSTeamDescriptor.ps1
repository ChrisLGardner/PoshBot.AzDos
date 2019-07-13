function GetVSTeamDescriptor {
    [PoshBot.BotCommand(Aliases = ('GetTeamDescriptor'))]
    [CmdletBinding(DefaultParameterSetName='ByStorageKey')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByStorageKey', Mandatory=$true)]
    [string]
    ${StorageKey})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamDescriptor', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamDescriptor
.ForwardHelpCategory Function

#>

}  


