

# Clone niroyb/DCOS repo

    git clone git@github.com:niroyb/DCOS.git

# [Install Pester](https://github.com/pester/Pester/wiki/Installation-and-Update)

    (testing framework)
    Install-Module -Name Pester -Force -SkipPublisherCheck


# [Install and configure Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-5.1.1)
  
    PS D:\github\nick> Get-Module PowerShellGet -list | Select-Object Name,Version,Path
    Name          Version Path
    ----          ------- ----
    PowerShellGet 1.0.0.1 C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PowerShellGet.psd1

    PS D:\github\nick> Install-Module AzureRM -AllowClobber

# [Create a service principal](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html)

        PS D:\github\nick\ScaleUp> az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTIONID"
        Retrying role assignment creation: 1/36
        {
          "appId": "3c870b83-fc7d-4528-8950-3ba5e1da27c2",
          "displayName": "azure-cli-2018-01-30-01-56-30",
          "name": "http://azure-cli-2018-01-30-01-56-30",
          "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "tenant": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        }


  Note: you  might get the following error this if you are not a owner of your subscription 
  
          PS D:\github\nick\ScaleUp> az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998"
        Role assignment creation failed.

        role assignment response headers: {'Cache-Control': 'no-cache', 'Pragma': 'no-cache', 'Content-Type': 'application/json; charset=utf-8', 'Expires': '-1', 'x-ms-failure-cause': 'gateway', 'x-ms-request-id': '69ead45c-763a-4cfb-82c0-4421c98605a9', 'x-ms-correlation-request-id': '69ead45c-763a-4cfb-82c0-4421c98605a9', 'x-ms-routing-request-id': 'WESTUS2:20180130T015758Z:69ead45c-763a-4cfb-82c0-4421c98605a9', 'Strict-Transport-Security': 'max-age=31536000; includeSubDomains', 'Date': 'Tue, 30 Jan 2018 01:57:58 GMT', 'Connection': 'close', 'Content-Length': '307'}

        The client 'soccerl@ntdev.microsoft.com' with object id 'd5080403-0c12-4bea-afea-01f17ee4c5d0' does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998'.
        PS D:\github\nick\ScaleUp>


# Create environment variable file



  It will contains service credential info.
  
# Run test script

  PS D:\github\nick\ScaleUp> invoke-pester -script  .\ScaleUp.Tests.ps1
