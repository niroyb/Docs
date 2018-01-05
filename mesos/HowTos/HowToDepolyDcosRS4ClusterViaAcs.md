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
