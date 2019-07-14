function GetVSTeamServiceEndpointType {
    [PoshBot.BotCommand(Aliases = ('GetTeamServiceEndpointType'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByType')]
    [string]
    ${Type},

    [Parameter(ParameterSetName='ByType')]
    [string]
    ${Scheme})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamServiceEndpointType', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamServiceEndpointType
.ForwardHelpCategory Function

#>

}  



