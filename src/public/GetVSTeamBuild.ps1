function GetVSTeamBuild {
    [PoshBot.BotCommand(Aliases = ('GetTeamBuild'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('succeeded','partiallySucceeded','failed','canceled')]
    [string]
    ${ResultFilter},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('manual','individualCI','batchedCI','schedule','userCreated','validateShelveset','checkInShelveset','triggered','all')]
    [string]
    ${ReasonFilter},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('inProgress','completed','cancelling','postponed','notStarted','all')]
    [string]
    ${StatusFilter},

    [Parameter(ParameterSetName='List')]
    [int[]]
    ${Queues},

    [Parameter(ParameterSetName='List')]
    [int[]]
    ${Definitions},

    [Parameter(ParameterSetName='List')]
    [string]
    ${BuildNumber},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('build','xaml')]
    [string]
    ${Type},

    [Parameter(ParameterSetName='List')]
    [int]
    ${MaxBuildsPerDefinition},

    [Parameter(ParameterSetName='List')]
    [string[]]
    ${Properties},

    [Parameter(ParameterSetName='ByID', ValueFromPipeline=$true)]
    [Alias('BuildID')]
    [int[]]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamBuild', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Builds' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamBuild
.ForwardHelpCategory Function

#>

}  



