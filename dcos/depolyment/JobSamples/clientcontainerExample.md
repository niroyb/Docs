            { 
              "id": "4", 
              "cmd": null, 
              "cpus": 0.1, 
              "mem": 512, 
              "disk": 0, 
              "instances": 1,
              "uris": [
                "https://fetcherstorage.blob.core.windows.net/fetchercontainer/helper.zip"
              ],
              "container": { 
                  "type": "DOCKER", 
                  "volumes": [], 
                  "docker": { 
                              "image": "msitest/test:clientcontainer", 
                              "privileged": false, 
                              "parameters": [ 
                                                { 
                                                "key": "network", 
                                                "value": "nat" 
                                                },
                                                {
                                                "key": "env",
                                                "value": "IMSProxyIpAddress"
                                                }
                              ],
                              "forcePullImage": false
                  }
              },
            "acceptedResourceRoles": [
              "slave_public"
            ]
          } 
