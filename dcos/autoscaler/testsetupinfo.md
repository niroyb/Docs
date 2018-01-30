

git clone git@github.com:niroyb/DCOS.git



[install Pester] (https://github.com/pester/Pester/wiki/Installation-and-Update)
(testing framework)

  Install-Module -Name Pester -Force -SkipPublisherCheck


PS D:\github\nick> invoke-pester -script  .\ScaleUp\ScaleUp.Tests.ps1
Executing all tests in '.\ScaleUp\ScaleUp.Tests.ps1'

Executing script .\ScaleUp\ScaleUp.Tests.ps1



Create a service principal:

https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html


az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998"

