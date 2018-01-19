      { 
        "id": "3", 
        "cmd": null, 
        "cpus": 0.1, 
        "mem": 512, 
        "disk": 0, 
        "instances": 1, 
        "constraints": [
          [
            "os",
            "LIKE",
            "windows"
          ]
        ],        
        "container": { 
            "type": "DOCKER", 
            "volumes": [], 
            "docker": { 
                        "image": "msitest/test:proxycontainer", 
                        "privileged": false, 
                        "parameters": [ 
                                          { 
                                          "key": "network", 
                                          "value": "nat" 
                                          },
                                          {
                                          "key": "label",
                                          "value": "MSIProxyContainer"
                                          },
                                          { 
                                          "key":"publish", 
                                          "value":"80:80" 
                                          }
                        ],
                        "forcePullImage": false
            }
        },
      "acceptedResourceRoles": [
        "slave_public"
      ]
    } 
