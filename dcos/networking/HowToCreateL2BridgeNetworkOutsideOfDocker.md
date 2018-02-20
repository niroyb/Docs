
# How to create a L2Bridge network outside of Docker

Stop dockerd

PS C:\temp> ipmo ./Hns.psm1


PS C:\temp> New-HNSNetwork -Type l2bridge  -AddressPrefix 10.123.6.0/23 -Gateway 172.8.128.1 -Name Newl2bridge


            ActivityId             : 98af786c-6087-48bb-9713-5d36a8aadc1f
            CurrentEndpointCount   : 0
            Extensions             : {@{Id=e7c3b2f0-f3c5-48df-af2b-10fed6d72e7a; IsEnabled=False}, @{Id=e9b59cfa-2be1-4b21-828f-b6fbdbddc017; IsEnabled=True}, @{Id=ea24cd6c-d17a-4348-9190-09f0d5be83dd; IsEnabled=False}}
            ID                     : 24ac39cd-5cf4-4fc5-a44f-b595db50d1fb
            LayeredOn              : edcaa7d6-696c-4646-9503-c154c689d1cc
            MacPools               : {@{EndMacAddress=00-15-5D-EF-BF-FF; StartMacAddress=00-15-5D-EF-B0-00}}
            MaxConcurrentEndpoints : 0
            Name                   : Newl2bridge
            Policies               : {}
            Resources              : @{AllocationOrder=0; ID=98af786c-6087-48bb-9713-5d36a8aadc1f; PortOperationTime=0; State=1; SwitchOperationTime=0; VfpOperationTime=0; parentId=16f5a92e-8eb5-4daa-af02-592e9ea54340}
            State                  : 1
            Subnets                : {@{AddressPrefix=10.123.6.0/23; GatewayAddress=172.8.128.1}}
            TotalEndpoints         : 0
            Type                   : l2bridge
            Version                : 21474836481

Restart the dockerd service

PS C:\temp> docker network ls

    NETWORK ID          NAME                DRIVER              SCOPE
    5d5cfd9d23c5        Newl2bridge         l2bridge            local
    1354a3427a84        nat                 nat                 local
    12f913f53959        none                null                local

PS C:\temp>


PS C:\WINDOWS\system32> docker run -it --network=Newl2bridge busybox

    / # ls -a
    .     proc
    ..    root
    bin   sys
    dev   tmp
    etc   usr
    home  var
    / #

PS C:\WINDOWS\system32> docker run -it --network=Newl2bridge busybox

    / # ls
    bin   root
    dev   sys
    etc   tmp
    home  usr
    proc  var
    / #

PS C:\temp> docker network inspect Newl2bridge

        [
            {
                "Name": "Newl2bridge",
                "Id": "5d5cfd9d23c5862d854d9116fff28980fac2b09f3a7d2649d14e32c948cc6817",
                "Created": "2017-11-29T16:06:34.8208419-08:00",
                "Scope": "local",
                "Driver": "l2bridge",
                "EnableIPv6": false,
                "IPAM": {
                    "Driver": "windows",
                    "Options": null,
                    "Config": [
                        {
                            "Subnet": "10.123.6.0/23",
                            "Gateway": "172.8.128.1"
                        }
                    ]
                },
                "Internal": false,
                "Attachable": false,
                "Ingress": false,
                "ConfigFrom": {
                    "Network": ""
                },
                "ConfigOnly": false,
                "Containers": {
                    "093e29d093e44ea97b3156fa564cd6a5be3432b7cd78e89f06ee19d00f743704": {
                        "Name": "wonderful_shockley",
                        "EndpointID": "3cb31520d431adf97b9cf7aee8c73f8e4ba0ff328a95e9e267df3ce490b1ce91",
                        "MacAddress": "00:15:5d:ef:ba:4d",
                        "IPv4Address": "10.123.7.107/8",
                        "IPv6Address": ""
                    },
                    "fa1a8a02306f1082eab305b26cab74751aa1576ff74b98e550c2f52611ef28ef": {
                        "Name": "jovial_cray",
                        "EndpointID": "91c7774666182493909615846914a996e786d28c45b7a62dc53486dcff1b374d",
                        "MacAddress": "00:15:5d:ef:b3:eb",
                        "IPv4Address": "10.123.7.188/8",
                        "IPv6Address": ""
                    }
                },
                "Options": {
                    "com.docker.network.windowsshim.hnsid": "24ac39cd-5cf4-4fc5-a44f-b595db50d1fb",
                    "com.docker.network.windowsshim.networkname": "Newl2bridge"
                },
                "Labels": {}
            }
        ]


