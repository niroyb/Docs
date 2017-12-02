
# How to setup a DC/OS cluster in Azure via ACS engine 



- generate cluster deployment file
          
          D:\dcos\acsEngine>acs-engine.exe generate dcos-hybrid-1w.json
          // output could be found under the _output directory
          D:\dcos\acsEngine\_output\soccerl-mastera0>
          
- acs-engine.exe generate dcos-hybrid-1w.json

          By default, the generated output files will use Windows server 2016 as Windows Agent OS. If you want to use 1709 build, you need modify these lines in azuredeploy.json manually for now,  
          "agentWindowsOffer": "WindowsServerSemiAnnual"
          "agentWindowsPublisher": "MicrosoftWindowsServer"
          "agentWindowsSku": "Datacenter-Core-1709-with-Containers-smalldisk",



          By default, the generated output files will use Windows server 2016 as Windows Agent OS. If you want to use 1709 build, you need modify these lines in azuredeploy.json manually for now,  
          "agentWindowsOffer": "WindowsServerSemiAnnual"
          "agentWindowsPublisher": "MicrosoftWindowsServer"
          "agentWindowsSku": "Datacenter-Core-1709-with-Containers-smalldisk",


- az login

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


- Deploy our DCOS cluster environment: 

          az group deployment create -g soccerl-dcos-msi --template-file azuredeploy.json --parameters @azuredeploy.parameters.json  


See job example in iis_job_example.txt


# DCOS CLI

[DC/OS CLI installation](https://dcos.io/docs/1.9/cli/install/#windows)

dcos config set core.dcos_url http://soccerl-master14.westus2.cloudapp.azure.com
dcos help
