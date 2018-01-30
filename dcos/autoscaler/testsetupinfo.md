

git clone git@github.com:niroyb/DCOS.git



[install Pester] (https://github.com/pester/Pester/wiki/Installation-and-Update)
(testing framework)

  Install-Module -Name Pester -Force -SkipPublisherCheck


# [Create a service principa](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html)

  az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998"


# [Install and configure Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-5.1.1)
  
    PS D:\github\nick> Get-Module PowerShellGet -list | Select-Object Name,Version,Path
    Name          Version Path
    ----          ------- ----
    PowerShellGet 1.0.0.1 C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PowerShellGet.psd1

    PS D:\github\nick> Install-Module AzureRM -AllowClobber


# Run test script


  PS D:\github\nick> invoke-pester -script  .\ScaleUp\ScaleUp.Tests.ps1
  Executing all tests in '.\ScaleUp\ScaleUp.Tests.ps1'

  Executing script .\ScaleUp\ScaleUp.Tests.ps1

