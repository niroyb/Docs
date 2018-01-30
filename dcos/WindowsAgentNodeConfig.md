
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
      
  ###     dcos-mesos-slave 
   Note:
   
   service-wrapper.exe is a light weight WinNT service wrapper for any executable to run inside a Windows 
   
   service context without worrying about the Service API. 
   
   mesos-agent.exe runs inside the dcos-mesos-slave service, which was service-wrapper.exe
   
   See HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dcos-mesos-slave for detailed service parameters
   
   This wrapper's source code is located [here](https://github.com/cloudbase/OpenStackService)

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



