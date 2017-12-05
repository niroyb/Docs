

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
