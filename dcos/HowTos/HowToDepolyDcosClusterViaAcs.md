
# How to setup a DC/OS cluster in Azure via ACS engine 

- [Install Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

- Get the latest acs-engine.exe 
   
      You can find one in \\apollon\public\Soccerl\acs\ for windows

- Get a DC/OS cluster depolyment json file

     Sample cluster definiton json file

	[dcos-1w1LRs3.json](https://github.com/soccerGB/Docs/blob/master/dcos/dcosDeployment/ClusterDefinitionSamples/dcos-1w1LRs3.json.md): This is the servercore version of RS3.
	
	[dcos-1w1LRs3_custom.json.md](https://github.com/soccerGB/Docs/blob/master/dcos/dcosDeployment/ClusterDefinitionSamples/dcos-1w1LRs3_custom.json.md) : This custom RS3 VHD image has UI!!



     Note: if you are using your own json file, make sure the DCOS verison is "1.10.0", not "1.10"

- Use ACS to Generate cluster deployment files
          
          D:\dcos\acsEngine>acs-engine generate Hybrid_1W_1L.json
           Generating assets into _output/dcos-rs30055...

          D:\dcos\acsEngine>cd _output\dcos-rs30055

          D:\dcos\acsEngine\_output\dcos-rs30055>dir
           Volume in drive D is Data
           Volume Serial Number is B6F0-767C

           Directory of D:\dcos\acsEngine\_output\dcos-rs30055

          02/16/2018  03:55 PM    <DIR>          .
          02/16/2018  03:55 PM    <DIR>          ..
          02/16/2018  04:53 PM             2,318 apimodel.json
          02/16/2018  04:53 PM            97,993 azuredeploy.json
          02/16/2018  04:53 PM             2,561 azuredeploy.parameters.json
                         3 File(s)        102,872 bytes
                         2 Dir(s)  362,288,611,328 bytes free

          D:\dcos\acsEngine\_output\dcos-rs30055>

          Note: Do the following two steps to prepare azuredeploy.json for deployment:
               
               1.By default, the generated output files will use Windows server 2016 as Windows Agent OS. 
                 If you want to use 1709 build, you need modify these lines in azuredeploy.json manually for now,  
                 "agentWindowsOffer": "WindowsServerSemiAnnual"
                 "agentWindowsPublisher": "MicrosoftWindowsServer"
                 "agentWindowsSku": "Datacenter-Core-1709-with-Containers-smalldisk",
                 
                 
                2. Due to ane existing acs-engine bug, if your deployment does not involve any preprovision, 
		   you would need to search "preprovisionExtensionParams" and remove the following exact 
		   string from azuredeploy.json.

	               ' -preprovisionExtensionParams \"\"',

                 
- Login to Azure Portal

          D:\dcos\acsEngine\_output\dcos-rs30055>>az login
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

          D:\dcos\acsEngine\_output\dcos-rs30055>az group create -l westus2 -n soccerl-dcos-msi
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


- Deploy DCOS cluster environment: 

          D:\dcos\acsEngine\_output\dcos-rs30055>
          az group deployment create -g soccerl-dcos-msi --template-file azuredeploy.json --parameters azuredeploy.parameters.json  

          Note: it will take ~10 mins to completed

- Sample DCOS job json

     [iis_job_example](https://github.com/soccerGB/Docs/blob/master/dcos/dcosDeployment/JobSamples/iis_job_example.txt)
     
     [Other examples](https://github.com/soccerGB/Docs/tree/master/dcos/dcosDeployment/JobSamples)
     


# DCOS CLI

[DC/OS CLI installation](https://dcos.io/docs/1.9/cli/install/#windows)

dcos config set core.dcos_url http://soccerl-master14.westus2.cloudapp.azure.com
dcos help
