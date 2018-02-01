
      
# Master node : dcos-diagnostics.service    

      dcos-diagnostics.service: DC/OS Diagnostics Master: aggregates and exposes component health

      root@dcos-master-14267337-0:/etc/systemd/system# vi ./dcos-diagnostics.service
      
      [Unit]
      Description=DC/OS Diagnostics Master: aggregates and exposes component health
      [Service]
      EnvironmentFile=/opt/mesosphere/environment
      EnvironmentFile=/opt/mesosphere/etc/dcos-diagnostics.env
      EnvironmentFile=-/opt/mesosphere/etc/dcos-diagnostics-extra.env
      Restart=always
      StartLimitInterval=0
      RestartSec=5
      LimitNOFILE=16384
      PermissionsStartOnly=True
      User=dcos_diagnostics
      # Allow r/w access to the socket file
      SupplementaryGroups=dcos_adminrouter
      ExecStartPre=/opt/mesosphere/bin/bootstrap dcos-diagnostics-master
      ExecStartPre=/opt/mesosphere/bin/bootstrap dcos-checks-master
      ExecStart=/opt/mesosphere/bin/dcos-diagnostics daemon --config ${DCOS_DIAGNOSTICS_CONFIG_PATH}
      Sockets=dcos-diagnostics.socket

##    Service configuration

      root@dcos-master-14267337-0:/opt/mesosphere/etc
      dcos-diagnostics.env
      dcos-diagnostics-config.json
      dcos-diagnostics-endpoint-config.json
      dcos-diagnostics-runner-config.json
      
###         dcos-diagnostics.env      

      root@dcos-master-14267337-0:/opt/mesosphere/etc# cat /opt/mesosphere/etc/dcos-diagnostics.env
      DCOS_DIAGNOSTICS_CONFIG_PATH=/opt/mesosphere/etc/dcos-diagnostics-config.json

###         dcos-diagnostics-config.json

      root@dcos-master-14267337-0:/etc/systemd/system# cat /opt/mesosphere/etc/dcos-diagnostics-config.json
      {
        "role": "master",
        "pull": true,
        "diagnostics-bundle-dir": "/var/lib/dcos/dcos-diagnostics/diag-bundles",
        "endpoint-config": "/opt/mesosphere/etc/dcos-diagnostics-endpoint-config.json",
        "no-unix-socket": true,
        "agent-port": 61001
      }
  ###        dcos-diagnostics-endpoint-config.json
 
      root@dcos-master-14267337-0:/opt/mesosphere/etc# cat dcos-diagnostics-endpoint-config.json
      {
        "HTTPEndpoints": [
            {
                "Port": 5050,
                "Uri": "/__processes__",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/flags",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/frameworks",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/maintenance/schedule",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/maintenance/status",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/roles",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/slaves",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/state",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/state-summary",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/tasks",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/metrics/snapshot",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/registrar(1)/registry",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/system/stats.json",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/version",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/metrics",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/apps",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/deployments",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/eventSubscriptions",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/groups",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/info",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/leader",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/queue",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/tasks",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/list",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/log",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/state",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/status",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/config/get-state",
                "Role": ["master"]
            },
            {
                "Port": 5051,
                "Uri": "/__processes__",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/metrics/snapshot",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/slave/flags",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/slave/state",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/system/stats.json",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 8123,
                "Uri": "/v1/config",
                "Role": ["master"]
            },
            {
                "Port": 8123,
                "Uri": "/v1/version",
                "Role": ["master"]
            },
            {
                "Port": 15055,
                "Uri": "/history/last",
                "Role": ["master"]
            },
            {
                "Port": 15055,
                "Uri": "/history/minute",
                "Role": ["master"]
            },
            {
                "Port": 15055,
                "Uri": "/history/hour",
                "Role": ["master"]
            }
        ],
        "LocalFiles": [
            {
                "Location": "/opt/mesosphere/active.buildinfo.full.json"
            },
            {
                "Location": "/opt/mesosphere/etc/dcos-version.json"
            },
            {
                "Location": "/opt/mesosphere/etc/expanded.config.json"
            },
            {
                "Location": "/opt/mesosphere/etc/user.config.yaml"
            },
            {
                "Location": "/var/lib/dcos/exhibitor/zookeeper/snapshot/myid",
                "Role": ["master"]
            },
            {
                "Location": "/var/lib/dcos/exhibitor/conf/zoo.cfg",
                "Role": ["master"]
            }
        ],
        "LocalCommands": [
            {
                "Command": ["dmesg"]
            }
        ]
      }
      root@dcos-master-14267337-0:/opt/mesosphere/etc#

###        dcos-diagnostics-runner-config.json

      root@dcos-master-14267337-0:/opt/mesosphere/etc# cat dcos-diagnostics-runner-config.json
      {
        "node_checks": {
          "checks": {
            "components_master": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "master",
                "components"
              ],
              "roles": [
                "master"
              ],
              "timeout": "3s",
              "description": "All DC/OS components are healthy."
            },
            "tar": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "tar"
              ],
              "timeout": "1s",
              "description": "The tar utility is available"
            },
            "mesos_master_replog_synchronized": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "master",
                "mesos-metrics"
              ],
              "roles": [
                "master"
              ],
              "timeout": "1s",
              "description": "The Mesos master has synchronized its replicated log"
            },
            "journald_dir_permissions": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "journald"
              ],
              "timeout": "1s",
              "description": "Journald directory has the right owners and permissions"
            },
            "components_agent": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "agent",
                "components",
                "--port",
                "61001"
              ],
              "roles": [
                "agent"
              ],
              "timeout": "3s",
              "description": "All DC/OS components are healthy"
            },
            "ip_detect_script": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "ip"
              ],
              "timeout": "1s",
              "description": "The IP detect script produces valid output"
            },
            "mesos_agent_registered_with_masters": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "agent",
                "mesos-metrics"
              ],
              "roles": [
                "agent"
              ],
              "timeout": "1s",
              "description": "The Mesos agent has registered with the masters"
            },
            "xz": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "xz"
              ],
              "timeout": "1s",
              "description": "The xz utility is available"
            },
            "clock_sync": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "time"
              ],
              "timeout": "1s",
              "description": "System clock is in sync."
            },
            "curl": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "curl"
              ],
              "timeout": "1s",
              "description": "The curl utility is available"
            },
            "unzip": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "unzip"
              ],
              "timeout": "1s",
              "description": "The unzip utility is available"
            }
          },
          "prestart": [],
          "poststart": [
            "components_master",
            "components_agent",
            "xz",
            "tar",
            "curl",
            "unzip",
            "ip_detect_script",
            "mesos_master_replog_synchronized",
            "mesos_agent_registered_with_masters",
            "journald_dir_permissions",
            "clock_sync"
          ]
        },
        "check_env": {
          "PATH": "/opt/mesosphere/bin:/usr/bin:/bin:/sbin",
          "LD_LIBRARY_PATH": "/opt/mesosphere/lib"
        }
      }
      root@dcos-master-14267337-0:/opt/mesosphere/etc#


# Linux agent : dcos-diagnostics.service

      dcos-diagnostics.service:DC/OS Diagnostics Agent: exposes component health
        
      root@dcos-linpub40012-14267337-000001:/etc# vi ./systemd/system/dcos-diagnostics.service

      [Unit]
      Description=DC/OS Diagnostics Agent: exposes component health
      [Service]
      EnvironmentFile=/opt/mesosphere/environment
      EnvironmentFile=/opt/mesosphere/etc/dcos-diagnostics.env
      EnvironmentFile=-/opt/mesosphere/etc/dcos-diagnostics-extra.env
      Restart=always
      StartLimitInterval=0
      RestartSec=5
      LimitNOFILE=16384 
      PermissionsStartOnly=True
      User=dcos_diagnostics
      # Allow r/w access to the socket file
      SupplementaryGroups=dcos_adminrouter
      ExecStartPre=/opt/mesosphere/bin/bootstrap dcos-diagnostics-agent
      ExecStartPre=/opt/mesosphere/bin/bootstrap dcos-checks-agent
      ExecStart=/opt/mesosphere/bin/dcos-diagnostics daemon --config ${DCOS_DIAGNOSTICS_CONFIG_PATH}
      Sockets=dcos-diagnostics.socket
      
##    Service configuration

      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc# ls *diagnostics*
      dcos-diagnostics.env  
      dcos-diagnostics-config.json  
      dcos-diagnostics-endpoint-config.json  
      dcos-diagnostics-runner-config.json
      
 ###    dcos-diagnostics.env
      
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc# cat dcos-diagnostics.env
      DCOS_DIAGNOSTICS_CONFIG_PATH=/opt/mesosphere/etc/dcos-diagnostics-config.json
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc#
      
 ###    dcos-diagnostics-config.json   
      
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc# cat dcos-diagnostics-config.json
      {
        "role": "agent_public",
        "endpoint-config": "/opt/mesosphere/etc/dcos-diagnostics-endpoint-config.json",
        "agent-port": 61001
      }
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc#      
      
 ###    dcos-diagnostics-endpoint-config.json
 
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc# cat dcos-diagnostics-endpoint-config.json
      {
        "HTTPEndpoints": [
            {
                "Port": 5050,
                "Uri": "/__processes__",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/flags",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/frameworks",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/maintenance/schedule",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/maintenance/status",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/roles",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/slaves",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/state",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/state-summary",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/master/tasks",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/metrics/snapshot",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/registrar(1)/registry",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/system/stats.json",
                "Role": ["master"]
            },
            {
                "Port": 5050,
                "Uri": "/version",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/metrics",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/apps",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/deployments",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/eventSubscriptions",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/groups",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/info",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/leader",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/queue",
                "Role": ["master"]
            },
            {
                "Port": 8080,
                "Uri": "/v2/tasks",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/list",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/log",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/state",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/cluster/status",
                "Role": ["master"]
            },
            {
                "Port": 8181,
                "Uri": "/exhibitor/v1/config/get-state",
                "Role": ["master"]
            },
            {
                "Port": 5051,
                "Uri": "/__processes__",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/metrics/snapshot",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/slave/flags",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/slave/state",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 5051,
                "Uri": "/system/stats.json",
                "Role":["agent", "agent_public"]
            },
            {
                "Port": 8123,
                "Uri": "/v1/config",
                "Role": ["master"]
            },
            {
                "Port": 8123,
                "Uri": "/v1/version",
                "Role": ["master"]
            },
            {
                "Port": 15055,
                "Uri": "/history/last",
                "Role": ["master"]
            },
            {
                "Port": 15055,
                "Uri": "/history/minute",
                "Role": ["master"]
            },
            {
                "Port": 15055,
                "Uri": "/history/hour",
                "Role": ["master"]
            }
        ],
        "LocalFiles": [
            {
                "Location": "/opt/mesosphere/active.buildinfo.full.json"
            },
            {
                "Location": "/opt/mesosphere/etc/dcos-version.json"
            },
            {
                "Location": "/opt/mesosphere/etc/expanded.config.json"
            },
            {
                "Location": "/opt/mesosphere/etc/user.config.yaml"
            },
            {
                "Location": "/var/lib/dcos/exhibitor/zookeeper/snapshot/myid",
                "Role": ["master"]
            },
            {
                "Location": "/var/lib/dcos/exhibitor/conf/zoo.cfg",
                "Role": ["master"]
            }
        ],
        "LocalCommands": [
            {
                "Command": ["dmesg"]
            }
        ]
      }
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc#
      
### dcos-diagnostics-runner-config.json
      
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc# cat dcos-diagnostics-runner-config.json
      {
        "node_checks": {
          "checks": {
            "components_master": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "master",
                "components"
              ],
              "roles": [
                "master"
              ],
              "timeout": "3s",
              "description": "All DC/OS components are healthy."
            },
            "tar": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "tar"
              ],
              "timeout": "1s",
              "description": "The tar utility is available"
            },
            "mesos_master_replog_synchronized": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "master",
                "mesos-metrics"
              ],
              "roles": [
                "master"
              ],
              "timeout": "1s",
              "description": "The Mesos master has synchronized its replicated log"
            },
            "journald_dir_permissions": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "journald"
              ],
              "timeout": "1s",
              "description": "Journald directory has the right owners and permissions"
            },
            "components_agent": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "agent",
                "components",
                "--port",
                "61001"
              ],
              "roles": [
                "agent"
              ],
              "timeout": "3s",
              "description": "All DC/OS components are healthy"
            },
            "ip_detect_script": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "ip"
              ],
              "timeout": "1s",
              "description": "The IP detect script produces valid output"
            },
            "mesos_agent_registered_with_masters": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "--role",
                "agent",
                "mesos-metrics"
              ],
              "roles": [
                "agent"
              ],
              "timeout": "1s",
              "description": "The Mesos agent has registered with the masters"
            },
            "xz": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "xz"
              ],
              "timeout": "1s",
              "description": "The xz utility is available"
            },
            "clock_sync": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "time"
              ],
              "timeout": "1s",
              "description": "System clock is in sync."
            },
            "curl": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "curl"
              ],
              "timeout": "1s",
              "description": "The curl utility is available"
            },
            "unzip": {
              "cmd": [
                "/opt/mesosphere/bin/dcos-checks",
                "executable",
                "unzip"
              ],
              "timeout": "1s",
              "description": "The unzip utility is available"
            }
          },
          "prestart": [],
          "poststart": [
            "components_master",
            "components_agent",
            "xz",
            "tar",
            "curl",
            "unzip",
            "ip_detect_script",
            "mesos_master_replog_synchronized",
            "mesos_agent_registered_with_masters",
            "journald_dir_permissions",
            "clock_sync"
          ]
        },
        "check_env": {
          "PATH": "/opt/mesosphere/bin:/usr/bin:/bin:/sbin",
          "LD_LIBRARY_PATH": "/opt/mesosphere/lib"
        }
      }root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc#

      


# Node Checks
      Node checks report the status of individual nodes after installation. Node checks can be run post-installation by
      connecting to an individual node via SSH. You can view which node checks have been defined by SSHing to your cluster 
      node and running this command: /opt/mesosphere/bin/dcos-shell dcos-diagnostics check node-poststart --list
      
      root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc# /opt/mesosphere/bin/dcos-shell dcos-diagnostics check node-poststart --list
            {
              "clock_sync": {
                "description": "System clock is in sync.",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "time"
                ],
                "timeout": "1s"
              },
              "components_agent": {
                "description": "All DC/OS components are healthy",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "--role",
                  "agent",
                  "components",
                  "--port",
                  "61001"
                ],
                "timeout": "3s"
              },
              "curl": {
                "description": "The curl utility is available",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "executable",
                  "curl"
                ],
                "timeout": "1s"
              },
              "ip_detect_script": {
                "description": "The IP detect script produces valid output",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "ip"
                ],
                "timeout": "1s"
              },
              "journald_dir_permissions": {
                "description": "Journald directory has the right owners and permissions",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "journald"
                ],
                "timeout": "1s"
              },
              "mesos_agent_registered_with_masters": {
                "description": "The Mesos agent has registered with the masters",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "--role",
                  "agent",
                  "mesos-metrics"
                ],
                "timeout": "1s"
              },
              "tar": {
                "description": "The tar utility is available",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "executable",
                  "tar"
                ],
                "timeout": "1s"
              },
              "unzip": {
                "description": "The unzip utility is available",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "executable",
                  "unzip"
                ],
                "timeout": "1s"
              },
              "xz": {
                "description": "The xz utility is available",
                "cmd": [
                  "/opt/mesosphere/bin/dcos-checks",
                  "executable",
                  "xz"
                ],
                "timeout": "1s"
              }
            }
            root@dcos-linpub40012-14267337-000001:/opt/mesosphere/etc#



