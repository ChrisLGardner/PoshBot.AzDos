function GetVSTeamGroup {
    [PoshBot.BotCommand(Aliases = ('GetTeamGroup'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ListByProjectName')]
    [Parameter(ParameterSetName='List')]
    [ValidateSet('vssgp','aadgp')]
    [string[]]
    ${SubjectTypes},

    [Parameter(ParameterSetName='List')]
    [string]
    ${ScopeDescriptor},

    [Parameter(ParameterSetName='ByGroupDescriptor', Mandatory=$true)]
    [Alias('GroupDescriptor')]
    [string]
    ${Descriptor})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamGroup', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Groups' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamGroup
.ForwardHelpCategory Function

#>

}  



