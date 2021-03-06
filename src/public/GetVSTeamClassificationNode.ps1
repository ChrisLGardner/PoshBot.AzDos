function GetVSTeamClassificationNode {
    [PoshBot.BotCommand(Aliases = ('GetTeamClassificationNode'))]
    [CmdletBinding(DefaultParameterSetName='ByIds')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ByPath', Mandatory=$true)]
    [ValidateSet('areas','iterations')]
    [string]
    ${StructureGroup},

    [Parameter(ParameterSetName='ByPath')]
    [string]
    ${Path},

    [Parameter(ParameterSetName='ByIds')]
    [int[]]
    ${Ids},

    [Parameter(ParameterSetName='ByIds')]
    [Parameter(ParameterSetName='ByPath')]
    [int]
    ${Depth})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamClassificationNode', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Team Classification Nodes' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamClassificationNode
.ForwardHelpCategory Function

#>

}  



