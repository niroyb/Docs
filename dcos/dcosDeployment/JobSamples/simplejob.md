      {
        "id": "simplejob",
        "cmd": "ping -t 127.0.0.1",
        "cpus": 1,
        "mem": 512,
        "disk": 0,
        "instances": 1,
        "constraints": [
          [
            "os",
            "LIKE",
            "Windows"
          ]
        ],
        "container": {
          "type": "DOCKER",
          "volumes": [],
          "networks": [ { "mode": "container", "name": "nat_network" } ],
          "docker": {
            "network": "BRIDGE",
            "image": "microsoft/iis:windowsservercore-1709",
            "privileged": false,
            "parameters": [
              {
                "key": "publish",
                "value": "80:80"
              }
            ],
            "forcePullImage": false
          }
        },
        "healthChecks": [
          {
            "gracePeriodSeconds": 300,
            "intervalSeconds": 60,
            "timeoutSeconds": 20,
            "maxConsecutiveFailures": 3,
            "port": 80,
            "path": "/",
            "protocol": "HTTP",
            "ignoreHttp1xx": false
          }
        ],
        "acceptedResourceRoles": [
          "slave_public"
        ]
      }
