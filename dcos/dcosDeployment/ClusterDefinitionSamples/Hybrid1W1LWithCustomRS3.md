{
  "apiVersion": "vlabs",
  "properties": {
    "orchestratorProfile": {
      "orchestratorType": "DCOS",
      "orchestratorVersion": "1.10.0"
    },
    "masterProfile": {
      "count": 3,
      "dnsPrefix": "dcos-rs30056",
      "vmSize": "Standard_D2_v2"
    },
    "agentPoolProfiles": [
      {
        "name": "wpubrs30056",
        "count": 1,
        "vmSize": "Standard_D2s_v3",
        "osType": "Windows",
        "dnsPrefix": "wpubrs30056",
        "ports": [
             80,
             443,
             8080,
             3389
          ]
      },
      {
        "name": "lpubrs30056",
        "count": 1,
        "vmSize": "Standard_D2_v2",
        "osType": "linux",
        "dnsPrefix": "lpubrs30056",
        "ports": [
             80,
             443,
             22
          ]
      }
    ],
    "windowsProfile": {
      "adminUsername": "azureuser",
      "adminPassword": "replacepassword1234$",
      "WindowsImageSourceUrl": "https://soccerlstorage.blob.core.windows.net/rs3container/AzureWindowsRS3.vhd"
    },
    "linuxProfile": {
      "adminUsername": "azureuser",
      "ssh": {
        "publicKeys": [
          {
            "keyData": "insert your ssh key here"
          }
        ]
      }
    }
  }
}
