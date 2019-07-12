function RemoveVSTeamAccessControlList {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamAccessControlList'))]
    [CmdletBinding(DefaultParameterSetName='ByNamespace', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${SecurityNamespace},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [ValidateScript({ 
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
       })]
    [string]
    ${SecurityNamespaceId},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [string[]]
    ${Tokens},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [switch]
    ${Recurse},

    [switch]
    ${Force})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamAccessControlList', [System.Management.Automation.CommandTypes]::Function)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#

.ForwardHelpTargetName Remove-VSTeamAccessControlList
.ForwardHelpCategory Function

#>

}  
