


# Open firewall

0. Inside the cluster : Open up the inbound traffics for port 61001
1. On the windows agent slave node: add the following firewall rule
netsh advfirewall firewall add rule name="Open Port 61001 for admin router" dir=in action=allow protocol=TCP localport=61001



# Run
c:\DCOS\diagnostics>dcos-diagnostics.exe daemon --role agent --debug --no-unix-socket --port 9003 --endpoint-config "C:\dcos\diagnostics\config\dcos-diagnostics-endpoint-config.json"
