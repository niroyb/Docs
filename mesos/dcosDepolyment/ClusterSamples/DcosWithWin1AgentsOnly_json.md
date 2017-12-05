      {
        "apiVersion": "vlabs",
        "properties": {
          "orchestratorProfile": {
            "orchestratorType": "DCOS"
          },
          "masterProfile": {
            "count": 1,
            "dnsPrefix": "soccerl-w1001",
            "vmSize": "Standard_D2_v2"
          },
          "agentPoolProfiles": [
            {
              "name": "w1001",
              "count": 1,
              "vmSize": "Standard_D2_v2",
              "osType": "Windows",
              "dnsPrefix": "dnsw1001",
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
