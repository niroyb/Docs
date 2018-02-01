- Connect to the Azure VM. 

        such as $ ssh azureuser@52.151.56.159

- /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.5.2.2/extension.log

        azureuser@dcos-master-28955507-0:~$ sudo -i
        root@dcos-master-28955507-0:~#
        root@dcos-master-28955507-0:~# ls /var/log
        apt       azure  cloud-init.log         dist-upgrade  fsck      lastlog  samba   unattended-upgrades  wtmp
        auth.log  btmp   cloud-init-output.log  dpkg.log      kern.log  lxd      syslog  waagent.log
        root@dcos-master-28955507-0:~# less /var/log/cloud-init.log
        root@dcos-master-28955507-0:~#
        root@dcos-master-28955507-0:~# less /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.5.2.2/
        CommandExecution.log  extension.log
        root@dcos-master-28955507-0:~# less /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.5.2.2/extension.log
        root@dcos-master-28955507-0:~# tail -n 100 /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.5.2.2/extension.log
        2018/02/01 19:48:51 ping: unknown host leader.mesos
        2018/02/01 19:48:51 ping: unknown host leader.mesos
        ...
        2018/02/01 19:48:51
        2018/02/01 19:48:51
        root@dcos-master-28955507-0:~#
        
// In this specifc case that Dmistris showed us, it's caused by the fact that dcos-setup.service failed! See below.
        
        root@dcos-master-28955507-0:~# systemctl | grep spartan
        root@dcos-master-28955507-0:~# systemctl | grep dcos
        ● dcos-setup.service
                 loaded failed failed, Pkgpanda: Specialize DC/OS for this host.
                 
        root@dcos-master-28955507-0:~#


