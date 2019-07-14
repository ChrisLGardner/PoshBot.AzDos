function GetVSTeamReleaseDefinition {
    [PoshBot.BotCommand(Aliases = ('GetTeamReleaseDefinition'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('environments','artifacts','none')]
    [string]
    ${Expand},

    [Parameter(ParameterSetName='ByID', ValueFromPipelineByPropertyName=$true)]
    [Alias('ReleaseDefinitionID')]
    [int[]]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamReleaseDefinition', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Release Definitions' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamReleaseDefinition
.ForwardHelpCategory Function

#>

}  



