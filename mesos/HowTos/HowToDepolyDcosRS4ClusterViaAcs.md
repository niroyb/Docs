
# How to setup a DC/OS cluster with RS4 Windows nodes in Azure via ACS engine 

- [Install Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

- Create a DC/OS cluster depolyment json file

     Here is the example file I used 

           {
        "apiVersion": "vlabs",
        "properties": {
          "orchestratorProfile": {
            "orchestratorType": "DCOS",
            "orchestratorRelease": "1.10"
          },
          "masterProfile": {
            "count":1,
            "dnsPrefix": "dcos-rs40001",
            "vmSize": "Standard_DS5_v2"
          },
          "agentPoolProfiles": [
            {
              "name": "wrs40001",
              "count": 1,
              "vmSize": "Standard_D2s_v3",
              "osType": "Windows",
              "dnsPrefix": "wpub40001",
              "availabilityProfile": "AvailabilitySet",
              "ports": [
                   80,
                   443,
                   8080,
                   3389
                ]
            }
          ],
          "windowsProfile": {
            "adminUsername": "azureuser",
            "adminPassword": "replacepassword1234$",
            "WindowsImageSourceUrl": "https://soccerlstoragers4stack2.blob.core.windows.net/rs4stack2container/AzureRs4Stack2.vhd"
          },
          "linuxProfile": {
            "adminUsername": "azureuser",
            "ssh": {
              "publicKeys": [
                {
                  "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYkJbzHCY038GVzfDQX2VYT1kZhJa4oMW/D6Z2G/NEoKeB3K/zUux95w7HtdYaq3RXNxk2dMtJv27QOUmOuPpdVWCKjwi03XvhRwHwuwlkJVRb4DLgoK7QPG+j04KtPSsgOj8Qd+ljXwHB2Zpz2kFifVF1D8mcEpRWZvxhpYSt6Ze2yqdxkffq3wddJuXskGsTSYTOcBzLwGcr4c9+kA3S8fnoAW0LRyXyOvB8v0YKqIJ8t3J/g4Lj3iCGIwOWraJ2EwnpOsAzhxgBRbiWflG/cHhxDlQsOYIbJcCfb7cSkow0Qcrff/gwzBtNCuANowDeGjyL/fzu9NrSQZZzgEdf soccerl@hdvm"
                }
              ]
            }
          }
        }
      }

     
     [Examples](https://github.com/soccerGB/Docs/blob/master/dcos/depolyment/DCOSClusterDefinitionJsonFiles.md)

- Use ACS to Generate cluster deployment files
          
          D:\dcos\acsEngine>acs-engine.exe generate dcos-hybrid-1w.json
          // output could be found under the _output directory
          D:\dcos\acsEngine\_output\soccerl-mastera0>dir
           Volume in drive D is Data
           Volume Serial Number is B6F0-767C

           Directory of D:\dcos\acsEngine\_output\soccerl-mastera0

          12/01/2017  03:56 PM    <DIR>          .
          12/01/2017  03:56 PM    <DIR>          ..
          12/01/2017  03:56 PM             1,915 apimodel.json
          12/01/2017  04:11 PM            60,807 azuredeploy.json
          12/01/2017  03:56 PM             1,998 azuredeploy.parameters.json
                         3 File(s)         64,720 bytes
                         2 Dir(s)  499,426,963,456 bytes free

          Note: By default, the generated output files will use Windows server 2016 as Windows Agent OS. 
                If you want to use 1709 build, you need modify these lines in azuredeploy.json manually for now,  
                "agentWindowsOffer": "WindowsServerSemiAnnual"
                "agentWindowsPublisher": "MicrosoftWindowsServer"
                 "agentWindowsSku": "Datacenter-Core-1709-with-Containers-smalldisk",
                 
- Login to Azure Portal

          D:\dcos\acsEngine\_output\soccerl-mastera0>az login
          To sign in, use a web browser to open the page https://aka.ms/devicelogin and enter the code FUAK5RCPC to authenticate.
          [
            {
              "cloudName": "AzureCloud",
              "id": "e5839dfd-61f0-4b2f-b06f-de7fc47b5998",
              "isDefault": true,
              "name": "EOSG Dev and Test",
              "state": "Enabled",
              "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
              "user": {
                "name": "soccerl@ntdev.microsoft.com",
                "type": "user"
              }
            },
            {
              "cloudName": "AzureCloud",
              "id": "2cd20493-fe97-42ef-9ace-ab95b63d82c4",
              "isDefault": false,
              "name": "Linux Integration Services Dev & Test",
              "state": "Enabled",
              "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
              "user": {
                "name": "soccerl@ntdev.microsoft.com",
                "type": "user"
              }
            }
          ]

- Create new resource group

          D:\dcos\acsEngine\_output\soccerl-mastera0>az group create -l westus2 -n soccerl-dcos-msi
                {
                  "id": "/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998/resourceGroups/soccerl-dcos-msi",
                  "location": "westus2",
                  "managedBy": null,
                  "name": "soccerl-dcos-msi",
                  "properties": {
                    "provisioningState": "Succeeded"
                  },
                  "tags": null
                }

          D:\dcos\acsEngine\_output\soccerl-mastera0>


- Deploy DCOS cluster environment: 

          az group deployment create -g soccerl-dcos-msi --template-file azuredeploy.json --parameters @azuredeploy.parameters.json  

          Note: it will take ~10 mins to completed

- Sample DCOS job json

     [iis_job_example](https://github.com/soccerGB/Docs/blob/master/dcos/depolyment/iis_job_example.txt)


# DCOS CLI

[DC/OS CLI installation](https://dcos.io/docs/1.9/cli/install/#windows)

dcos config set core.dcos_url http://soccerl-master14.westus2.cloudapp.azure.com
dcos help



PS D:\dcos\acsEngine2> .\acs-engine.exe generate dcos-1winSalve.json
[36mINFO[0m[0000] Generating assets into _output/dcos-rs40001...

PS D:\dcos\acsEngine2> cd .\_output\

PS D:\dcos\acsEngine2\_output> az group create -l westus2 -n soccerl-dcos-rs4
{
  "id": "/subscriptions/e5839dfd-61f0-4b2f-b06f-de7fc47b5998/resourceGroups/soccerl-dcos-rs4",
  "location": "westus2",
  "managedBy": null,
  "name": "soccerl-dcos-rs4",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null
}

PS D:\dcos\acsEngine2\_output\dcos-rs40001> az group deployment create -g soccerl-dcos-rs4 --template-file azuredeploy.json --parameters azuredeploy.parameters.json
