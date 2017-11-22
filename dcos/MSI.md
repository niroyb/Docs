
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
