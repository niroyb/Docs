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
                
# Metromone framework paramerters

        /opt/mesosphere/packages/metronome--467e4c64f804dbd4cd8572516e111a3f9298c10d/conf
        root@dcos-master-32683824-0:/opt/mesosphere/packages/metronome--467e4c64f804dbd4cd8572516e111a3f9298c10d/conf# cat logback.xml
        <configuration>
          <conversionRule conversionWord="coloredLevel" converterClass="play.api.libs.logback.ColoredLevel" />
          <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
            <encoder>
              <pattern>%coloredLevel %logger{15} - %message%n%xException{10}</pattern>
            </encoder>
          </appender>
          <appender name="ASYNCSTDOUT" class="ch.qos.logback.classic.AsyncAppender">
            <appender-ref ref="STDOUT" />
          </appender>
          <logger name="play" level="INFO" />
          <logger name="dcos" level="INFO" />
          <logger name="mesosphere" level="INFO" />
          <logger name="akka" level="INFO" />
          <logger name="com.avaje.ebean.config.PropertyMapLoader" level="OFF" />
          <logger name="com.avaje.ebeaninternal.server.core.XmlConfigLoader" level="OFF" />
          <logger name="com.avaje.ebeaninternal.server.lib.BackgroundThread" level="OFF" />
          <logger name="com.gargoylesoftware.htmlunit.javascript" level="OFF" />
          <root level="WARN">
            <appender-ref ref="ASYNCSTDOUT" />
          </root>
        </configuration>
        
       root@dcos-master-32683824-0:/opt/mesosphere/packages/metronome--467e4c64f804dbd4cd8572516e111a3f9298c10d/conf# cat  application.conf
        metronome {
          akka {
            # (Optional. Default: 10 seconds) max duration (in millis) an actor might take to startup.
            actor.startup.max = ${?METRONOME_AKKA_ACTOR_STARTUP_MAX}

            # (Optional. Default: 10 seconds) ask timeout.
            ask.timeout = ${?METRONOME_AKKA_ASK_TIMEOUT}
          }

          # (Optional. Default: true) If true, actor metrics will be collected.
          behavior.metrics = ${?METRONOME_BEHAVIOR_METRICS}

          # (Optional. Default: None): Enable the selected features. Options to use:
          # "vips" (Currently n/a) can be used to enable the networking VIP integration UI.
          # "task_killing" can be used to enable the TASK_KILLING state in Mesos (0.28 or later)
          # "external_volumes" (Currently n/a) can be used if the cluster is configured to use external volumes.
          # Example: --enable_features vips,task_killing,external_volumes
          features.enable = ${?METRONOME_FEATURES_ENABLE}

          # (Optional. Default: "metronome") Framework name used to register with mesos.
          framework.name = ${?METRONOME_FRAMEWORK_NAME}

          # (Optional. Default: 10) Maximum number of JobRun history entries.
          history.count = ${?METRONOME_HISTORY_COUNT}

          leader {
            # (Optional. Default: java.net.InetAddress.getLocalHost.getHostName) Hostname used for leader election and proxying.
            election.hostname = ${?METRONOME_LEADER_ELECTION_HOSTNAME}

            # (Optional. Default: 3 minutes) Maximum duration it may take to prepare taking over leadership.
            preparation.timeout = ${?METRONOME_LEADER_PREPARATION_TIMEOUT}

            # (Optional. Default: 30 seconds) Leader proxy request timeout.
            proxy.timeout = ${?METRONOME_LEADER_PROXY_TIMEOUT}
          }

          mesos {
            #  (Optional) The Mesos principal used for framework authentication.
            authentication.principal = ${?METRONOME_MESOS_AUTHENTICATION_PRINCIPAL}

            # (Optional) The path to the secret file used for framework authentication.
            authentication.secret.file = ${?METRONOME_MESOS_AUTHENTICATION_SECRET_FILE}

            # (Optional. Default: "//cmd"): Executor to use when none is specified.
            executor.default = ${?METRONOME_MESOS_EXECUTOR_DEFAULT}

            # (Optional. Default: (1 week)) The failover timeout for Mesos in seconds. If a Metronome instance has not
            # re-registered with Mesos after a failover within this timeout, Mesos will shut down all running tasks started by
            # this framework. Requires checkpointing to be enabled.
            failover.timeout = ${?METRONOME_MESOS_FAILOVER_TIMEOUT}

            # (Optional) The url pointing to the leading mesos master UI. If not provided, it will be set to
            # "http://${master.getHostname}:${master.getPort}/" upon registration with mesos.
            # Note: When this option is set, the given url should always load balance to current Mesos master
            leader.ui.url = ${?METRONOME_MESOS_LEADER_UI_URL}

            # (Optional. Default: "localhost:5050") The url pointing to the mesos master.
            master.url = ${?METRONOME_MESOS_MASTER_URL}

            # (Optional. Default: None): Mesos role for this framework. If set, Marathon receives resource offers for the
            # specified role in addition to unreserved resources.
            role = ${?METRONOME_MESOS_ROLE}

            # (Optional. Default: current user): Mesos user for this framework. Note: Default is determined by
            # SystemProperties.get("user.name").
            user = ${?METRONOME_MESOS_USER}
          }

          # (Optional) Path to the plugin configuration file.
          plugin.conf = ${?METRONOME_PLUGIN_CONF}

          # (Optional) Path to the directory containing plugin jars.
          plugin.dir = ${?METRONOME_PLUGIN_DIR}

          scheduler {
            # (Optional. Default: 15 minutes) The period (in milliseconds) between task reconciliation.
            reconciliation.interval = ${?METRONOME_SCHEDULER_RECONCILIATION_INTERVAL}

            # (Optional. Default: 1 minute) The timeout (in milliseconds) after which task reconciliation is considered finished.
            # Likely to be removed in the future.
            reconciliation.timeout = ${?METRONOME_SCHEDULER_RECONCILIATION_TIMEOUT}

            # (Optional. Default: true) Flag indicating that caching shall be used for internal entity stores.
            store.cache = ${?METRONOME_SCHEDULER_STORE_CACHE}

            # (Optional): The prefix to add to the name of task's environment variables created automatically by Metronome.
            # Note: This prefix will not be added to variables that are already prefixed, such as MESOSTASKID and MARATHONAPP_ID
            task.env.vars.prefix = ${?METRONOME_SCHEDULER_TASK_ENV_VARS_PREFIX}

            # (Optional. Default: 5 minutes) Time, in milliseconds, to wait for a task to enter TASK_RUNNING before killing it.
            task.launch.timeout = ${?METRONOME_SCHEDULER_TASK_LAUNCH_TIMEOUT}

            # (Optional. Default: 5 minutes) Timeout in milliseconds to wait for a task to enter the TASK_STAGING state
            # before killing it.
            task.launch.confirm.timeout = ${?METRONOME_SCHEDULER_TASK_LAUNCH_CONFIRM_TIMEOUT}

            # (Optional. Default: 24 hours) The timeout in milliseconds after which a lost task is garbage collected and
            # expunged from the task tracker and task repository.
            task.lost.expunge.gc = ${?METRONOME_SCHEDULER_TASK_LOST_EXPUNGE_GC}

            # (Optional. Default: 5 minutes) The initial delay in milliseconds before Metronome begins to periodically perform
            # task expunge gc operations for lost tasks.
            task.lost.expunge.initial.delay = ${?METRONOME_SCHEDULER_TASK_LOST_EXPUNGE_INITIAL_DELAY}

            # (Optional. Default: 1 hour) The interval in milliseconds for lost task gc operations.
            task.lost.expunge.interval = ${?METRONOME_SCHEDULER_TASK_LOST_EXPUNGE_INTERVAL}
          }

          zk {
            # (Optional. Default: true) Enable compression of zk nodes, if the size of the node is bigger than the configured threshold.
            compression.enabled = ${?METRONOME_ZK_COMPRESSION_ENABLED}

            # (Optional. Default: 64 KB) Threshold in bytes, when compression is applied to the zk node
            compression.threshold = ${?METRONOME_ZK_COMPRESSION_THRESHOLD}

            # (Optional. Default: 10 seconds) ZooKeeper session timeout in milliseconds.
            session_timeout = ${?METRONOME_ZK_SESSION_TIMEOUT}

            # (Optional. Default: 10 seconds) Timeout for ZooKeeper in milliseconds
            timeout = ${?METRONOME_ZK_TIMEOUT}

            # (Optional. Default: "zk://localhost:2181/metronome") ZooKeeper URL for storing state.
            # Format: zk://user@pass:host1:port1,user@pass:host2:port2,.../path. When authentication is enabled the default
            # ACL will be changed and all subsequent reads must be done using the same auth.
            url = ${?METRONOME_ZK_URL}
          }

          web.ui.url = ${?METRONOME_WEB_UI_URL}
        }        
        
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


# Linux Agent run parameters

        To be filled with information
        
        
          │ ├─dcos-mesos-slave-public.service
           │ │ └─36907 /opt/mesosphere/packages/mesos--aaedd03eee0d57f5c0d49c74ff1e5721862cad98/bin/mesos-agent
               │ └─17860 grep --color=auto mesos
               
           

        root@dcos-linpub40002-34185927-000001:/opt/mesosphere/etc# cat mesos-slave-public
        MESOS_RESOURCES=[{"name":"ports","type":"RANGES","ranges": {"range": [{"begin": 1, "end": 21},{"begin": 23, "end": 5050},{"begin": 5052, "end": 32000}]}}]
        MESOS_DEFAULT_ROLE=slave_public
        MESOS_ATTRIBUTES=public_ip:true
        root@dcos-linpub40002-34185927-000001:/opt/mesosphere/etc#
