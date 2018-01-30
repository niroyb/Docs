

# Clone niroyb/DCOS repo

  git clone git@github.com:niroyb/DCOS.git


# [install Pester] (https://github.com/pester/Pester/wiki/Installation-and-Update)
  (testing framework)

  Install-Module -Name Pester -Force -SkipPublisherCheck


# [Install and configure Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-5.1.1)
  
    PS D:\github\nick> Get-Module PowerShellGet -list | Select-Object Name,Version,Path
    Name          Version Path
    ----          ------- ----
    PowerShellGet 1.0.0.1 C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PowerShellGet.psd1

    PS D:\github\nick> Install-Module AzureRM -AllowClobber

# [Create a service principa](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html)

  az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998"

# Create environment variable file

  it will contains service credential info.
  

# Run test script

  PS D:\github\nick\ScaleUp> invoke-pester -script  .\ScaleUp.Tests.ps1
