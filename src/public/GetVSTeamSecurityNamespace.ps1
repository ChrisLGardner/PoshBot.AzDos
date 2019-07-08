function GetVSTeamSecurityNamespace {
    [PoshBot.BotCommand(Aliases = ('GetTeamSecurityNamespace'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [Parameter(ParameterSetName='ByNamespaceName', Mandatory=$true)]
    [string]
    ${Name},

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
    ${Id},

    [Parameter(ParameterSetName='List')]
    [switch]
    ${LocalOnly})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamSecurityNamespace', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamSecurityNamespace
.ForwardHelpCategory Function

#>

}  
