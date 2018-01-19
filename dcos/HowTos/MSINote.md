
# [IAM Docker](https://github.com/swipely/iam-docker)

$ sudo iptables -t nat \
                -I PREROUTING \
                -p tcp \
                -d 169.254.169.254 \
                --dport 80 \
                -j REDIRECT \
                --to-ports "$PORT" \
                -i "$INTERFACE"
                
                
PS C:\> Netsh interface portproxy add v4tov4 listenport=80 connectaddress=172.24.42.152 connectp.rt=8080 listenaddress=169.254.169.254 protocol=tcp

https://technet.microsoft.com/en-us/library/cc731068(v=ws.10).aspx#BKMK_1






# proxy container

C:\app>
C:\app>route add 169.254.169.254 MASK 255.255.255.255 172.24.32.1

PS C:\app> ipconfig

Windows IP Configuration


Ethernet adapter vEthernet (Ethernet) 2:

   Connection-specific DNS Suffix  . : 3xojbo1mt10efniqkq31gfg3ja.xx.internal.cloudapp.net
   Link-local IPv6 Address . . . . . : fe80::d9eb:871d:bf94:8d33%28
   IPv4 Address. . . . . . . . . . . : 172.24.38.149
   Subnet Mask . . . . . . . . . . . : 255.255.240.0
   Default Gateway . . . . . . . . . : 172.24.32.1
PS C:\app> python .\app.py
 * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
client request connecting...
retrun from 169.254.169.254 endpoint ...
172.24.33.167 - - [22/Nov/2017 10:11:21] "GET / HTTP/1.1" 200 -
client request connecting...



# client container

netsh interface ipv4 add address "vEthernet (Ethernet) 3" 169.254.169.254 255.255.255.0 172.24.32.1

PS C:\> Netsh interface portproxy add v4tov4 listenport=80 connectaddress=172.24.38.149 connectport=80 listenaddress=169.254.169.254 protocol=tcp


PS C:\> netsh  interface portproxy show all

Listen on ipv4:             Connect to ipv4:

Address         Port        Address         Port
--------------- ----------  --------------- ----------
169.254.169.254 80          172.24.38.149   80

PS C:\> Invoke-WebRequest -Uri "http://169.254.169.254" -Method GET  -UseBasicParsing

C:\msi\adobe>docker run -it clientcontainer
Microsoft Windows [Version 10.0.16299.19]

C:\>powershell
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------

PS C:\> netsh interface ipv4 add address "vEthernet (Ethernet) 3" 169.254.169.254 255.255.255.0 172.24.32.1

PS C:\> ipconfig

Windows IP Configuration


Ethernet adapter vEthernet (Ethernet) 3:

   Connection-specific DNS Suffix  . : 3xojbo1mt10efniqkq31gfg3ja.xx.internal.cloudapp.net
   Subnet Mask . . . . . . . . . . . : 255.255.240.0
   IPv4 Address. . . . . . . . . . . : 169.254.169.254
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 172.24.32.1
PS C:\> exit

C:\>Netsh interface portproxy add v4tov4 listenport=80 connectaddress=172.24.38.149 connectport=80 listenaddress=169.25
.169.254 protocol=tcp

PS C:\> Invoke-WebRequest -Uri "http://169.254.169.254" -Method GET  -UseBasicParsing


StatusCode        : 200
StatusDescription : OK
Content           : {"compute":{"location":"westus2","name":"26652acs900-vmss_1","offer":"WindowsServerSemiAnnual","osT
                    ype":"Windows","platformFaultDomain":"1","platformUpdateDomain":"1","publisher":"MicrosoftWindowsSe
                    rv...
RawContent        : HTTP/1.0 200 OK
                    Content-Length: 564
                    Content-Type: text/html; charset=utf-8
                    Date: Wed, 22 Nov 2017 11:45:59 GMT
                    Server: Werkzeug/0.12.2 Python/3.7.0a2

                    {"compute":{"location":"westus2","name":"26...
Forms             :
Headers           : {[Content-Length, 564], [Content-Type, text/html; charset=utf-8], [Date, Wed, 22 Nov 2017 11:45:59
                    GMT], [Server, Werkzeug/0.12.2 Python/3.7.0a2]}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        :
RawContentLength  : 564



PS C:\>

