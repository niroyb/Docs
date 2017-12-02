- Cluster with single winslave node

            D:\dcos\acsEngine>type dcos-hybrid-1w.json
            {
              "apiVersion": "vlabs",
              "properties": {
                "orchestratorProfile": {
                  "orchestratorType": "DCOS"
                },
                "masterProfile": {
                  "count": 1,
                  "dnsPrefix": "soccerl-mastera0",
                  "vmSize": "Standard_D2_v2"
                },
                "agentPoolProfiles": [
                  {
                    "name": "wina0",
                    "count": 1,
                    "vmSize": "Standard_D2_v2",
                    "osType": "Windows",
                    "dnsPrefix": "dnswina0",
                    "ports": [
                         80,
                         443,
                         8080,
                         3389
                      ],
                      "customNodeLabels" : {
                        "foo" : "bar",
                        "att1" : "value1"
                      }
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
                        "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYkJbzHCY038GVzfDQX2VYT1kZhJa4oMW/D6Z2G/NEoKeB3K/zUux95w7HtdYaq3RXNxk2dMtJv27QOUmOuPpdVWCKjwi03XvhRwHwuwlkJVRb4DLgoK7QPG+j04KtPSsgOj8Qd+ljXwHB2Zpz2kFifVF1D8mcEpRWZvxhpYSt6Ze2yqdxkffq3wddJuXskGsTSYTOcBzLwGcr4c9+kA3S8fnoAW0LRyXyOvB8v0YKqIJ8t3J/g4Lj3iCGIwOWraJ2EwnpOsAzhxgBRbiWflG/cHhxDlQsOYIbJcCfb7cSkow0Qcrff/gwzBtNCuANowDeGjyL/fzu9NrSQZZzgEdf soccerl@hdvm"
                      }
                    ]
                  }
                }
              }
            }

- Hybrid cluster with mixed Win and Linux slaves nodes

        { 
          "apiVersion": "vlabs", 
          "properties": { 
            "orchestratorProfile": { 
              "orchestratorType": "DCOS" 
            }, 
            "masterProfile": { 
              "count": 3, 
              "dnsPrefix": "dcos-mstr", 
              "vmSize": "Standard_D2_v2" 
            }, 
            "agentPoolProfiles": [ 
              { 
                "name": "wpub", 
                "count": 1, 
                "vmSize": "Standard_D2_v2", 
                "osType": "Windows", 
                "dnsPrefix": "wpub", 
                "ports": [ 
                     80, 
                     443, 
                     8080, 
                     3389 
                  ] 
              }, 
              { 
                "name": "wpri", 
                "count": 1, 
                "vmSize": "Standard_D2_v2", 
                "osType": "Windows", 
                "dnsPrefix": "" 
              }, 
              { 
                "name": "linpub", 
                "count": 1, 
                "vmSize": "Standard_D2_v2", 
                "osType": "linux", 
                "dnsPrefix": "linpub", 
                "ports": [ 
                     80, 
                     443, 
                     22 
                  ] 
              }, 
              { 
                "name": "linpri", 
                "count": 1, 
                "vmSize": "Standard_D2_v2", 
                "osType": "linux", 
                "dnsPrefix": "" 
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
                    "keyData": "replacesshkey" 
                  } 
                ] 
              } 
            } 
          } 
        } 

