      {
        "id": "/4001",
        "cmd": "docker ps & dir & cd c:\\temp & dir & powershell .\\LocateProxyAndSetEnv.ps1",
        "instances": 1,
        "cpus": 0.1,
        "mem": 128,
        "disk": 0,
        "gpus": 0,
        "constraints": [
          [
            "os",
            "LIKE",
            "windows"
          ]
        ],
        "backoffSeconds": 1,
        "backoffFactor": 1.15,
        "acceptedResourceRoles": [
          "slave_public"
        ]
      }
