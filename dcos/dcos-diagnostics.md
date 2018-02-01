
      
# Master node : dcos-diagnostics.service    

       dcos-diagnostics.service: DC/OS Diagnostics Master: aggregates and exposes component health

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
      
