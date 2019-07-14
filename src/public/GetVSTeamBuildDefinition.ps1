function GetVSTeamBuildDefinition {
    [PoshBot.BotCommand(Aliases = ('GetTeamBuildDefinition'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [string]
    ${Filter},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('build','xaml','All')]
    [string]
    ${Type},

    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true, Position=0)]
    [Alias('BuildDefinitionID')]
    [int[]]
    ${Id},

    [Parameter(ParameterSetName='ByID')]
    [Parameter(ParameterSetName='ByIdJson')]
    [Parameter(ParameterSetName='ByIdRaw')]
    [int]
    ${Revision},

    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true)]
    [switch]
    ${JSON},

    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true)]
    [switch]
    ${raw})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamBuildDefinition', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamBuildDefinition
.ForwardHelpCategory Function

#>

}  



