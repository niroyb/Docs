
## Zookeeper

root@ubuntu:/home/soccerl# cd mesos/build/3rdparty/zookeeper-3.4.8/bin
root@ubuntu:/home/soccerl/mesos/build/3rdparty/zookeeper-3.4.8/bin#  ./zkServer.sh start-foreground


##  Mesos Master 
root@ubuntu:/home/soccerl/mesos/build/bin# ./mesos-master.sh --ip=10.123.6.119 --work_dir=/var/lib/mesos --zk=zk://10.123.6.119:2181/mesos --advertise_ip=10.123.6.119 --quorum=1


## Marathon framework
export MESOS_NATIVE_JAVA_LIBRARY=/home/soccerl/mesos/build/src/.libs/libmesos.so 

root@ubuntu:/home/soccerl/marathon/marathon-1.4.3/bin# export MESOS_NATIVE_JAVA_LIBRARY=/home/soccerl/mesos/build/src/.libs/libmesos.so

 ./start --master zk://10.123.6.119:2181/mesos --zk zk://10.123.6.119:2181/marathon --task_launch_timeout 600000


## Windows slave

 .\mesos-agent.exe --master=zk://10.123.6.119:2181/mesos --ip=10.123.7.72 --work_dir=$HOME\work_dir --launcher_dir=D:\github\mesos\
build\src --isolation=windows/cpu,filesystem/windows --containerizers=docker,mesos
