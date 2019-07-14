function GetVSTeamWorkItem {
    [PoshBot.BotCommand(Aliases = ('GetTeamWorkItem'))]
    [CmdletBinding(DefaultParameterSetName='ByID')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [int]
    ${Id},

    [Parameter(ParameterSetName='List', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [int[]]
    ${Ids},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('Fail','Omit')]
    [string]
    ${ErrorPolicy},

    [ValidateSet('None','Relations','Fields','Links','All')]
    [string]
    ${Expand},

    [string[]]
    ${Fields})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamWorkItem', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Work Items' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamWorkItem
.ForwardHelpCategory Function

#>

}  



