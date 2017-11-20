# How to create a Docker L2Bridge network on Windows

* Find out the container subnet information of the Docker host net interface

  This is because a l2bridge network's subnet values needs to match the NIC’s interface of the Docker host. 
  (10.123.6.0/23 in below case)

    PS C:\WINDOWS\system32> ipconfig

    Windows IP Configuration

    Ethernet adapter vEthernet (1dbd1d411d598ce):

       Connection-specific DNS Suffix  . :
       Link-local IPv6 Address . . . . . : fe80::a577:1541:4f1c:abee%14
       IPv4 Address. . . . . . . . . . . : 172.8.128.1
       Subnet Mask . . . . . . . . . . . : 255.255.240.0
       Default Gateway . . . . . . . . . :

    Ethernet adapter vEthernet (nat):

       Connection-specific DNS Suffix  . :
       Link-local IPv6 Address . . . . . : fe80::cc2d:fa1:6058:fc53%4
       IPv4 Address. . . . . . . . . . . : 172.29.160.1
       Subnet Mask . . . . . . . . . . . : 255.255.240.0
       Default Gateway . . . . . . . . . :

    Ethernet adapter `Ethernet':

       Connection-specific DNS Suffix  . : corp.microsoft.com
       IPv6 Address. . . . . . . . . . . : 2001:4898:e0:1024:7168:c852:fc18:3a42
       Link-local IPv6 Address . . . . . : fe80::7168:c852:fc18:3a42%3
       IPv4 Address. . . . . . . . . . . : 10.123.7.48
       Subnet Mask . . . . . . . . . . . : '255.255.254.0`
       Default Gateway . . . . . . . . . : fe80::221:d7ff:feb8:3000%3
                                           `10.123.6.1`
                                           

* What is L2Bridge network?
  It's same as Docker MacVLan driver, see [here](https://docs.docker.com/engine/userguide/networking/get-started-macvlan/)

* Get the Net adapter information

        PS C:\WINDOWS\system32> `Get-NetAdapter`

        Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
        ----                      --------------------                    ------- ------       ----------             ---------

        vEthernet (1dbd1d411d5... Hyper-V Virtual Ethernet Adapter             14 Up           00-15-5D-4E-16-F0        10 Gbps

        vEthernet (nat)           Hyper-V Virtual Ethernet Adapter #2           4 Up           00-15-5D-9A-47-E2        10 Gbps

        `Ethernet`                 Intel(R) 82579LM Gigabit Network Con...       3 Up           A0-D3-C1-20-DD-5D       100 Mbps


 * Create l2bridge with adapter and host subnet information

    PS C:\WINDOWS\system32> docker network create -d l2bridge --subnet=10.123.6.0/23 --gateway=10.123.6.1 -o com.docker.network.windowsshim.interface="Ethernet" myl2bridge
    
                bb6b1535ad641bc982e03c9342d6ca6001fcd2b56eb4ad731900058096aaeae8
                
    PS C:\WINDOWS\system32> get-vmswitch

            Name   SwitchType NetAdapterInterfaceDescription
            ----   ---------- ------------------------------

            nat     Internal

            `mynat External   Intel(R) 82579LM Gigabit Network Connection`

    
    Note: you will hit "not adapter found" error message if there is already a vSwith created on the same adpater ("Ethernet" in this case. The L2Bridge require excuslive use of an adapter. You need to delete its corresponding vSwitch before recreating a L2Bridge.

     
    PS C:\WINDOWS\system32> `docker network ls`
    
            NETWORK ID          NAME                DRIVER              SCOPE

            `bb6b1535ad64        myl2bridge          l2bridge            local`

            cd58a7bc88fc        mynat               nat                 local

            401780b1e571        nat                 nat                 local

            b8d1c8277c39        none                null                local

   
    PS C:\WINDOWS\system32> `docker network inspect myl2bridge`
    
            [

                {

                    "Name": "myl2bridge",

                    "Id": "bb6b1535ad641bc982e03c9342d6ca6001fcd2b56eb4ad731900058096aaeae8",

                    "Created": "2017-11-19T19:26:05.0135505-08:00",

                    "Scope": "local",

                    "Driver": "l2bridge",

                    "EnableIPv6": false,

                    "IPAM": {

                        "Driver": "windows",

                        "Options": {},

                        "Config": [

                            {

                                "Subnet": "10.123.6.0/23",

                                "Gateway": "10.123.6.1"

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

                    "Containers": {},

                    "Options": {

                        "com.docker.network.windowsshim.hnsid": "b4069830-87b0-40cb-9b8f-b554d6cde1ea",

                        "com.docker.network.windowsshim.interface": "Ethernet"

                    },

                    "Labels": {}

                }
            ]

