      {
        "apiVersion": "vlabs",
        "properties": {
          "orchestratorProfile": {
            "orchestratorType": "DCOS",
            "orchestratorVersion": "1.10.0"
          },
          "masterProfile": {
            "count": 3,
            "dnsPrefix": "dcos-rs30055",
            "vmSize": "Standard_D2_v2"
          },
          "agentPoolProfiles": [
            {
              "name": "wpubrs30055",
              "count": 1,
              "vmSize": "Standard_D2s_v3",
              "osType": "Windows",
              "dnsPrefix": "wpubrs30055",
              "ports": [
                   80,
                   443,
                   8080,
                   3389
                ]
            },
            {
              "name": "lpubrs30055",
              "count": 1,
              "vmSize": "Standard_D2_v2",
              "osType": "linux",
              "dnsPrefix": "lpubrs30055",
              "ports": [
                   80,
                   443,
                   22
                ]
            }
          ],
          "windowsProfile": {
            "adminUsername": "azureuser",
            "adminPassword": "replacepassword1234$"
          },
          "linuxProfile": {
            "adminUsername": "azureuser",
            "ssh": {
              "publicKeys": [
                {
                  "keyData": "add your ssh key here.."
                }
              ]
            }
          }
        }
      }
