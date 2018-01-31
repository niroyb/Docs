
##  Linux Agent : services

        root@dcos-linpub40012-14267337-000001:~# systemctl | grep dcos
          sys-devices-virtual-net-d\x2ddcos.device   loaded active     plugged         /sys/devices/virtual/net/d-dcos
          sys-subsystem-net-devices-d\x2ddcos.device loaded active     plugged         /sys/subsystem/net/devices/d-dcos
          dcos-volume0.mount                         loaded inactive   dead      start /dcos/volume0
          dcos-volume1.mount                         loaded inactive   dead      start /dcos/volume1
          dcos-volume2.mount                         loaded inactive   dead      start /dcos/volume2
          dcos-volume3.mount                         loaded inactive   dead      start /dcos/volume3
          dcos-adminrouter-agent.service             loaded active     running         Admin Router Agent: exposes a unified control plane proxy for components and services using NGINX
          dcos-diagnostics.service                   loaded active     running         DC/OS Diagnostics Agent: exposes component health
          dcos-epmd.service                          loaded active     running         Erlang Port Mapping Daemon (EPMD): facilitates communication between distributed Erlang programs
          dcos-log-agent.service                     loaded active     running         DC/OS Log Agent: exposes agent node, component, and container (task) logs
          dcos-mesos-slave-public.service            loaded active     running         Mesos Agent Public: distributed systems kernel public agent
          dcos-metrics-agent.service                 loaded active     running         DC/OS Metrics Agent: exposes node, container, and application metrics
          dcos-navstar.service                       loaded active     running         Navstar: A distributed systems & network overlay orchestration engine
          dcos-pkgpanda-api.service                  loaded active     running         DC/OS Component Package Manager (Pkgpanda): installs and manages DC/OS components
          dcos-rexray.service                        loaded active     running         REX-Ray: A vendor agnostic storage orchestration engine
          dcos-spartan-watchdog.service              loaded activating start-pre start DNS Forwarder (Spartan) Watchdog: restarts Spartan when it is unhealthy
          dcos-spartan.service                       loaded active     running         DNS Forwarder (Spartan): forwards DNS requests to multiple DNS servers
          dcos-diagnostics.socket                    loaded active     running         DC/OS Diagnostics Agent Socket: socket for DC/OS Diagnostics Agent
          dcos-log-agent.socket                      loaded active     running         DC/OS Log Socket: socket for DC/OS Log service
          dcos-metrics-agent.socket                  loaded active     running         DC/OS Metrics Agent Socket: socket for DC/OS Metrics Agent service
          dcos.target                                loaded active     active          dcos.target
          dcos-docker-gc.timer                       loaded active     waiting         Docker GC Timer: timer to periodically trigger Docker GC
          dcos-gen-resolvconf.timer                  loaded active     waiting         Generate resolv.conf Timer: periodically updates the network name resolution configuration
          dcos-logrotate-agent.timer                 loaded active     waiting         Logrotate Timer: Timer to trigger every 2 minutes
          dcos-spartan-watchdog.timer                loaded active     running         DNS Forwarder (Spartan) Watchdog Timer: timer to periodically trigger Spartan Watchdog
        root@dcos-linpub40012-14267337-000001:~#


# Windows Agent node

## Mesos Agent binary list

        PS C:\dcos\mesos\bin> dir

        Directory: C:\dcos\mesos\bin
        Mode                LastWriteTime         Length Name
        ----                -------------         ------ ----
        d-----        1/27/2018   1:23 AM                bak
        -a----        1/29/2018  11:43 PM        2382336 curl.exe
        -a----        1/29/2018  11:59 PM       85065216 mesos-agent.exe
        -a----        1/29/2018  11:55 PM       16149504 mesos-containerizer.exe
        -a----        1/29/2018  11:56 PM       43906048 mesos-default-executor.exe
        -a----        1/29/2018  11:56 PM       44007936 mesos-docker-executor.exe
        -a----        1/29/2018  11:57 PM       44332032 mesos-executor.exe
        -a----        1/29/2018  11:57 PM       33486848 mesos-fetcher.exe
        -a----        1/29/2018  11:57 PM        2782720 mesos-tcp-connect.exe
        -a----        1/29/2018  11:57 PM       28662784 mesos-usage.exe

        C:\DCOS\mesos\service
        01/30/2018  02:20 AM           780,800 service-wrapper.exe

        
## Services 

        PS C:\dcos\mesos\bin> get-service
        Status   Name               DisplayName
        ------   ----               -----------
        ...
        Running  dcos-epmd          DCOS EPMD Windows Agent
        Running  dcos-mesos-slave   DCOS Mesos Windows Slave
        Running  dcos-spartan       DCOS Spartan Windows Agent
      
  
###     service-wrapper
    
        The wrapper binary is available at: http://dcos-win.westus.cloudapp.azure.com/downloads/service-wrapper.exe

        The wrapper accepts the following named parameters:
        •	--exec-start-pre, used to pass  a prestart script. This needs to be an executable recognized by the operating system. A cmd script will do just fine by default, but you can execute PowerShell as in the example given below.
        •	--service-name, used to pass the Windows service name.
        •	--environment-file, used to pass the environment file path to be loaded before the service starts. Multiple instances of this parameter can be passed.
        Besides the named parameters given above the wrapper also accepts a single positional parameter with the service binary.

        Here’s an example on how to create a Windows service using the wrapper, in PowerShell (make sure you have the proper escaping as given below when defining the Windows service):

        $wrapperPath = "C:\test\service-wrapper.exe"
        $serviceName = "test"
        $envFile1 = "C:\test\env-file-1"
        $envFile2 = "C:\test\env-file-2"
        $serviceBinaryPath = "C:\test\DumpEnv.exe"
        $preStartScript = "C:\test\pre-start-script.ps1"

        New-Service -Name $serviceName 
                    -DisplayName $serviceName 
                    -StartupType Automatic `
                    -BinaryPathName "`"$wrapperPath`" 
                    --exec-start-pre `"powershell.exe 
                    -File $preStartScript`" 
                    --service-name `"$serviceName`" 
                    --environment-file `"$envFile1`" 
                    --environment-file `"$envFile2`" `"$serviceBinaryPath`""
                    
  This wrapper's source code is located [here](https://github.com/cloudbase/OpenStackService)
     
  ###     dcos-mesos-slave 
   Note:
   
   service-wrapper.exe is a light weight WinNT service wrapper for any executable to run inside a Windows 
   
   service context without worrying about the Service API. 
   
   mesos-agent.exe runs inside the dcos-mesos-slave service, which was service-wrapper.exe
   
   See HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dcos-mesos-slave for detailed service parameters
   

   
   We have an updated service wrapper that supports multiple --environment-file parameters.

## parameters for dcos-mesos-slave 

    "C:\DCOS\mesos\service\service-wrapper.exe" 
    --service-name "dcos-mesos-slave" 
    --environment-file "C:\DCOS\mesos\service\environment-file" C:\DCOS\mesos\bin\mesos-agent.exe 
    --master="zk://192.168.255.5:2181/mesos" 
    --work_dir="C:\DCOS\mesos\work" 
    --runtime_dir="C:\DCOS\mesos\work" 
    --launcher_dir="C:\DCOS\mesos\bin" 
    --external_log_file="C:\DCOS\mesos\log\mesos-service.err.log" 
    --log_dir="C:\DCOS\mesos\log" 
    --ip="10.0.0.5" 
    --isolation="windows/cpu,filesystem/windows" 
    --containerizers="docker,mesos" --attributes="os:Windows;public_ip:yes" 
    --hostname="10.0.0.5" 
    --executor_environment_variables="{\\\"PATH\\\": \\\"C:\\Program Files\\Docker;C:\\DCOS\\mesos\\bin\\\"}" 
    --default_role="slave_public"



