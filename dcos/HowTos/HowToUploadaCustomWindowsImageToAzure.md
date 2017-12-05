

az storage blob url --account-name soccerlstorage --account-key "rTcJclTkQQTXXJzyTi3zXPCrCqzzOdoNF8NM7eecGyC+Tr1iayLACkKTy8h47nQeyPJSWWURzh6zWqn9LOhTmQ==" --container-name rs3container --name AzureWindowsRS3_2.vhd



az disk create --resource-group soccerl-rs3 --name rs1709disk2 --source "https://soccerlstorage.blob.core.windows.net/rs3container/AzureWindowsRS3_2.vhd"


az vm create --resource-group soccerl-rs3 --location westus2 --name wrs3vm2 --os-type windows --attach-os-disk rs1709disk2  --size Standard_D2s_v3

