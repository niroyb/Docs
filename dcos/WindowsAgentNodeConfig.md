
# Windows Agent node

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
