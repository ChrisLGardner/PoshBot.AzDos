Push-Location -Path $PSScriptRoot -StackName docker

Save-Module -Name PoshBot -RequiredVersion 0.11.6 -Path "$PSScriptRoot\Modules"

Save-Module -Name PoshBot.AzDos -RequiredVersion 0.1.0 -Path "$PSScriptRoot\Modules"

docker build . -t poshbot/azdos

Pop-Location -StackName docker
