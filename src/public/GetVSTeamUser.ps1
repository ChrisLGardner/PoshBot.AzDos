function GetVSTeamUser {
    [PoshBot.BotCommand(Aliases = ('GetTeamUser'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='List')]
    [ValidateSet('msa','aad','svc','imp','vss')]
    [string[]]
    ${SubjectTypes},

    [Parameter(ParameterSetName='ByUserDescriptor', Mandatory=$true)]
    [Alias('UserDescriptor')]
    [string]
    ${Descriptor})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamUser', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Users' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamUser
.ForwardHelpCategory Function

#>

}  



