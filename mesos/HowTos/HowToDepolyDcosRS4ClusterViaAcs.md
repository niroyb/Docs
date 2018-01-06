
# How to setup a DC/OS cluster with RS4 Windows nodes in Azure via ACS engine 

- [Install Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

       You want to pick up Bruce's private acs-engine.exe binary (Windows version) from \\apollon\public\Soccerl\acs

- Create a DC/OS cluster depolyment json file

     Here is the example delopment file I used: [dcos-1winSalve.json](https://github.com/soccerGB/Docs/blob/master/mesos/dcosDepolyment/ClusterSamples/dcos-1winSalve.json)

   Note: The key information from above json file is WindowsImageSourceUrl field. You would need to prepare a RS4 VHD for this purpose and stores it in an Azure storage account. Since we are sharing the same subscription, you can use my following vhd file.
   
           "windowsProfile": {
            ..
             "WindowsImageSourceUrl": "https://soccerlstoragers4stack2.blob.core.windows.net/rs4stack2container/AzureRs4Stack2.vhd"
           },

  
- Use ACS to Generate cluster deployment files
          
          PS D:\dcos\acsEngine2> .\acs-engine.exe generate dcos-1winSalve.json
          // output could be found under the _output directory
                
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

          D:\dcos\acsEngine\_output\soccerl-mastera0>az group create -l westus2 -n soccerl-dcos-rs4
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

- Deploy DCOS cluster environment: 


          PS D:\dcos\acsEngine2> cd .\_output\
          
          PS D:\dcos\acsEngine2\_output\dcos-rs40001> az group deployment create -g soccerl-dcos-rs4 --template-file azuredeploy.json --parameters azuredeploy.parameters.json
          
          Note: it will take ~10 mins to completed

- Sample DCOS job json

     [iis_job_example](https://github.com/soccerGB/Docs/blob/master/dcos/depolyment/iis_job_example.txt)

