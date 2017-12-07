# Services on the Mesos master node

        root@dcos-master-32683824-0:/# systemctl | grep dcos
          dcos-3dt.service                         loaded active     running         DC/OS Diagnostics (3DT) Master: aggregates and exposes component health
          dcos-adminrouter.service                 loaded active     running         Admin Router Master: exposes a unified control plane proxy for components and services using NGINX
          dcos-cosmos.service                      loaded active     running         DC/OS Package Manager (Cosmos): installs and manages DC/OS packages from DC/OS package repositories, such as the Mesosphere Universe
          dcos-epmd.service                        loaded active     running         Erlang Port Mapping Daemon (EPMD): facilitates communication between distributed Erlang programs
          dcos-exhibitor.service                   loaded active     running         Exhibitor: Zookeeper supervisor service
          dcos-history.service                     loaded active     running         DC/OS History: caches and exposes historical system state
          dcos-log-master.service                  loaded active     running         DC/OS Log Master: exposes master node and component logs
          dcos-marathon.service                    loaded active     running         Marathon: container orchestration engine
          dcos-mesos-dns.service                   loaded active     running         Mesos DNS: domain name based service discovery
          dcos-mesos-master.service                loaded active     running         Mesos Master: distributed systems kernel
          dcos-metrics-master.service              loaded active     running         DC/OS Metrics Master: exposes node metrics
          dcos-metronome.service                   loaded active     running         DC/OS Jobs (Metronome): job orchestration
          dcos-navstar.service                     loaded active     running         Navstar: A distributed systems & network overlay orchestration engine
          dcos-oauth.service                       loaded active     running         DC/OS Authentication (OAuth): authenticates DC/OS users using OpenID Connect and Auth0
          dcos-pkgpanda-api.service                loaded active     running         DC/OS Component Package Manager (Pkgpanda): installs and manages DC/OS components
          dcos-spartan-watchdog.service            loaded activating start-pre start DNS Forwarder (Spartan) Watchdog: restarts Spartan when it is unhealthy
          dcos-spartan.service                     loaded active     running         DNS Forwarder (Spartan): forwards DNS requests to multiple DNS servers
          dcos-3dt.socket                          loaded active     running         DC/OS Diagnostics (3DT) Agent Socket: socket for DC/OS Diagnostics Agent
          dcos-log-master.socket                   loaded active     running         DC/OS Log Socket: socket for DC/OS Log service
          dcos-metrics-master.socket               loaded active     running         DC/OS Metrics Master Socket: socket for DC/OS Metrics Master service
          dcos-pkgpanda-api.socket                 loaded active     running         DC/OS Component Package Manager (Pkgpanda) Socket: socket for DC/OS Component Package Manager
          dcos.target                              loaded active     active          dcos.target
          dcos-adminrouter-reload.timer            loaded active     waiting         Admin Router Reloader Timer: periodically reloads Admin Router to pick up domain resolution changes
          dcos-gen-resolvconf.timer                loaded active     waiting         Generate resolv.conf Timer: periodically updates the network name resolution configuration
          dcos-logrotate-master.timer              loaded active     waiting         Logrotate Timer: Timer to trigger every 2 minutes
          dcos-signal.timer                        loaded active     waiting         DC/OS Signal Timer: timer for DC/OS Signal service
          dcos-spartan-watchdog.timer              loaded active     running         DNS Forwarder (Spartan) Watchdog Timer: timer to periodically trigger Spartan Watchdog
        root@dcos-master-32683824-0:/#


        root@dcos-master-32683824-0:/# systemctl | grep mesos
          var-lib-mesos.mount                      loaded active     mounted         /var/lib/mesos
          dcos-mesos-dns.service                   loaded active     running         Mesos DNS: domain name based service discovery
          dcos-mesos-master.service                loaded active     running         Mesos Master: distributed systems kernel
        root@dcos-master-32683824-0:/#




# Marathon framework run parameters


                ├─dcos-marathon.service
                  └─36728 /opt/mesosphere/bin/java -Xmx2G -jar /opt/mesosphere/packages/marathon--bfb24f7f90cb3cd52a1cb22a07caafa5013bba21/usr/marathon.jar 

                --zk zk://zk-1.zk:2181,zk-2.zk:2181,zk-3.zk:2181,zk-4.zk:2181,zk-5.zk:2181/marathon 
                --master zk://zk-1.zk:2181,zk-2.zk:2181,zk-3.zk:2181,zk-4.zk:2181,zk-5.zk:2181/mesos 
                --hostname 192.168.255.5 
                --default_accepted_resource_roles * 
                --mesos_role slave_public 
                --max_tasks_per_offer 100 
                --task_launch_timeout 86400000 
                --decline_offer_duration 300000 
                --revive_offers_for_new_apps 
                --zk_compression 
                --mesos_leader_ui_url /mesos 
                --enable_features vips,task_killing,external_volumes,gpu_resources 
                --mesos_authentication_principal dcos_marathon 
                --mesos_user root
                
               
# Windows Agent node parameters

        C:\DCOS\mesos\service>notepad mesos-service.xml

        <configuration>
          <id>dcos-mesos-slave</id>
          <name>DCOS Mesos Windows Slave</name>
          <description>Windows Service for the DCOS Mesos Slave</description>
          <executable>C:\DCOS\mesos\bin\mesos-agent.exe</executable>
          <arguments>--master="zk://192.168.255.5:2181/mesos" --work_dir="C:\DCOS\mesos\work" --runtime_dir="C:\DCOS\mesos\work" --launcher_dir="C:\DCOS\mesos\bin" --log_dir="C:\DCOS\mesos\log" --ip="10.0.0.5" --isolation="windows/cpu,filesystem/windows" --containerizers="docker,mesos" --attributes="os:windows;public_ip:yes" --default_role="slave_public"</arguments>
          <logpath>C:\DCOS\mesos\log</logpath>
          <priority>Normal</priority>
          <stoptimeout>20 sec</stoptimeout>
          <stopparentprocessfirst>false</stopparentprocessfirst>
          <startmode>Automatic</startmode>
          <waithint>15 sec</waithint>
          <sleeptime>1 sec</sleeptime>
          <log mode="roll">
            <sizeThreshold>10240</sizeThreshold>
            <keepFiles>8</keepFiles>
          </log>
        </configuration>
