


# Open firewall

0. Inside the cluster : Open up the inbound traffics for port 61001
1. On the windows agent slave node: add the following firewall rule

      netsh advfirewall firewall add rule name="Open Port 61001 for admin router" dir=in action=allow protocol=TCP localport=61001

      PS C:\dcos\diagnostics> netsh advfirewall firewall show rule name="Open Port 61001 for admin router"

      Rule Name:                            Open Port 61001 for admin router
      ----------------------------------------------------------------------
      Enabled:                              Yes
      Direction:                            In
      Profiles:                             Domain,Private,Public
      Grouping:
      LocalIP:                              Any
      RemoteIP:                             Any
      Protocol:                             TCP
      LocalPort:                            61001
      RemotePort:                           Any
      Edge traversal:                       No
      Action:                               Allow
      Ok.



# Run
c:\DCOS\diagnostics>dcos-diagnostics.exe daemon --role agent --debug --no-unix-socket --port 9003 --endpoint-config "C:\dcos\diagnostics\config\dcos-diagnostics-endpoint-config.json"



# IIS Failed Requests Logging instructions

https://docs.microsoft.com/en-us/iis/troubleshoot/using-failed-request-tracing/troubleshooting-failed-requests-using-tracing-in-iis

# Web.config

[Creating Outbound Rules for URL Rewrite Module](https://docs.microsoft.com/en-us/iis/extensions/url-rewrite-module/creating-outbound-rules-for-url-rewrite-module)

