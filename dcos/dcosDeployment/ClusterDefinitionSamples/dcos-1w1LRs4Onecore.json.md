	{
	  "apiVersion": "vlabs",
	  "properties": {
	    "orchestratorProfile": {
	      "orchestratorType": "DCOS",
	      "orchestratorRelease": "1.10"
	    },
	    "masterProfile": {
	      "count":1,
	      "dnsPrefix": "dcos-rs40032",
	      "vmSize": "Standard_DS5_v2"
	    },
	    "agentPoolProfiles": [
	      {
		"name": "wrs40032",
		"count": 1,
		"vmSize": "Standard_D2s_v3",
		"preProvisionExtension": {
		    "name": "preprovision-agent-windows",
		    "singleOrAll": "All"
		},
		"osType": "Windows",
		"dnsPrefix": "wpub40032",
		"ports": [
		     80,
		     443,
		     8080,
		     3389
		  ]
	      },
	      {
		"name": "linpub40032",
		"count": 2,
		"vmSize": "Standard_D2_v2",
		"preProvisionExtension": {
		    "name": "preprovision-agent-linux-public",
		    "singleOrAll": "All"
		},
		"osType": "linux",
		"dnsPrefix": "linpub40032",
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
	      "WindowsImageSourceUrl": "https://soccerlstoragers4onecore.blob.core.windows.net/rs4onecorecontainer/AzureRs4Onecore.vhd"
	    },
	    "linuxProfile": {
	      "adminUsername": "azureuser",
	      "ssh": {
		"publicKeys": [
		  {
		    "keyData": "ssh-rsa ......." <-- add your ssh pub key
		  }
		]
	      }
	    },
	    "extensionProfiles": [
	      {
		"name": "preprovision-agent-linux-public",
		"version": "v1",
		"extensionParameters": "publicparameters",
		"rootURL": "http://13.68.86.214/preprovision/",
		"script": "preprovision-agent-linux-public.sh"
	      },
	      {
		"name": "preprovision-agent-linux-private",
		"version": "v1",
		"extensionParameters": "privateparameters",
		"rootURL": "http://13.68.86.214/preprovision/",
		"script": "preprovision-agent-linux-private.sh"
	      },
	      {
		"name": "preprovision-master-linux",
		"version": "v1",
		"extensionParameters": "masterparameters",
		"rootURL": "http://13.68.86.214/preprovision/",
		"script": "preprovision-master-linux.sh"
	      },
	      {
		"name": "preprovision-agent-windows",
		"version": "v1",
		"extensionParameters": "windowsparameters",
		"rootURL": "http://13.68.86.214/preprovision/",
		"script": "preprovision-agent-windows.ps1"
	      }
	    ]

	  }
	}
