
{
  "id": "globaltest3",
  "cmd": "powershell && dir && docker ps -a",
  "instances": 1,
  "cpus": 0.1,
  "mem": 128,
  "disk": 0,
  "gpus": 0,
  "backoffSeconds": 1,
  "backoffFactor": 1.15,
  "maxLaunchDelaySeconds": 3600,
  "constraints": [
    [
      "os",
      "LIKE",
      "windows"
    ]
  ],
  "acceptedResourceRoles": [
    "slave_public"
  ]
}
