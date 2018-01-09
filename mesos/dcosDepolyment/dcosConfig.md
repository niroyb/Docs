
# Mesos Windows [Agent Options](http://mesos.apache.org/documentation/latest/configuration/agent/)

    "C:\DCOS\mesos\bin\mesos-agent.exe" 
        --master="zk://192.168.255.5:2181/mesos" 
        --work_dir="C:\DCOS\mesos\work" 
        --runtime_dir="C:\DCOS\mesos\work" 
        --launcher_dir="C:\DCOS\mesos\bin" 
        --log_dir="C:\DCOS\mesos\log" 
        --ip="10.0.0.4" 
        --isolation="windows/cpu,filesystem/windows" 
        --containerizers="docker,mesos" 
        --attributes="os:Windows;public_ip:yes" 
        --default_role="slave_public"
