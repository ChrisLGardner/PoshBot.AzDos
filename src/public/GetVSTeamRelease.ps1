function GetVSTeamRelease {
    [PoshBot.BotCommand(Aliases = ('GetTeamRelease'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [ValidateSet('environments','artifacts','approvals','none')]
    [string]
    ${expand},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('Draft','Active','Abandoned')]
    [string]
    ${statusFilter},

    [Parameter(ParameterSetName='List')]
    [int]
    ${definitionId},

    [Parameter(ParameterSetName='List')]
    [int]
    ${top},

    [Parameter(ParameterSetName='List')]
    [string]
    ${createdBy},

    [Parameter(ParameterSetName='List')]
    [datetime]
    ${minCreatedTime},

    [Parameter(ParameterSetName='List')]
    [datetime]
    ${maxCreatedTime},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('ascending','descending')]
    [string]
    ${queryOrder},

    [Parameter(ParameterSetName='List')]
    [string]
    ${continuationToken},

    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true, Position=0)]
    [Alias('ReleaseID')]
    [int[]]
    ${id},

    [Parameter(ParameterSetName='ByIdJson', Mandatory=$true)]
    [switch]
    ${JSON},

    [Parameter(ParameterSetName='ByIdRaw', Mandatory=$true)]
    [switch]
    ${raw})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamRelease', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamRelease
.ForwardHelpCategory Function

#>

}  



