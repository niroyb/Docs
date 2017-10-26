
// generate cluster depolymentfile
D:\dcos\acsEngine>acs-engine.exe generate dcos-hybrid-1w.json
// output could be found under the _output directory

// create new resource group
az group create -l westus -n soccerl-dcos-1winslave 
 
 
//Deploy our DCOS cluster environment: 

az group deployment create -g soccerl-dcos-1winslave --template-file azuredeploy.json --parameters @azuredeploy.parameters.json  




===== iis job =====

{
  "id": "microsoft/iis",
  "instances": 4,
  "cpus": 1,
  "mem": 128,
  "constraints": [
    [
      "os",
      "LIKE",
      "Windows"
    ]
  ],
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "microsoft/iis",
      "parameters": [
        {
          "key": "network",
          "value": "nat"
        },
        {
          "key": "publish",
          "value": "80:80"
        }
      ]
    }
  },
  "acceptedResourceRoles": [
    "slave_public"
  ]
}
