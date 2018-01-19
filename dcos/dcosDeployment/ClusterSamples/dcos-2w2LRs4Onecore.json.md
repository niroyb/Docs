    {
      "apiVersion": "vlabs",
      "properties": {
        "orchestratorProfile": {
          "orchestratorType": "DCOS",
          "orchestratorRelease": "1.10"
        },
        "masterProfile": {
          "count":1,
          "dnsPrefix": "dcos-rs40007",
          "vmSize": "Standard_DS5_v2"
        },
        "agentPoolProfiles": [
          {
            "name": "wrs40007",
            "count": 3,
            "vmSize": "Standard_D2s_v3",
            "osType": "Windows",
            "dnsPrefix": "wpub40007",
            "availabilityProfile": "AvailabilitySet",
            "ports": [
                 80,
                 443,
                 8080,
                 3389
              ]
          },
          {
            "name": "win40007",
            "count": 1,
            "vmSize": "Standard_DS2_v2",
            "osType": "Windows",
            "dnsPrefix": ""
          },
          {
            "name": "linpub40007",
            "count": 2,
            "vmSize": "Standard_D2_v2",
            "osType": "linux",
            "dnsPrefix": "linpub40007",
            "ports": [
                    80,
                    443,
                    22
                    ]
          },
          {
            "name": "linux40007",
            "count": 1,
            "vmSize": "Standard_DS2_v2",
            "osType": "linux",
            "dnsPrefix": ""
          }
        ],
        "windowsProfile": {
          "adminUsername": "azureuser",
          "adminPassword": "replacepassword1234$",
          "WindowsImageSourceUrl": "https://soccerlstoragers4onecore.blob.core.windows.net/rs4onecorecontainer/AzureRs4Onecore.vhd"
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
