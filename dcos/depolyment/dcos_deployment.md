
# How to setup a DC/OS cluster in Azure via ACS engine 

// generate cluster depolymentfile

- acs-engine.exe generate dcos-hybrid-1w.json

// output could be found under the _output directory

// create new resource group
- az group create -l westus -n soccerl-dcos-1winslave 
 
//Deploy our DCOS cluster environment: 

- az group deployment create -g soccerl-dcos-1winslave --template-file azuredeploy.json --parameters @azuredeploy.parameters.json  


See job example in iis_job_example.txt
