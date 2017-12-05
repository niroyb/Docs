
# How to to access the DC/OS UI panels

Assuming 51.141.162.197 is the master node address

DC/OS UI

    http://51.141.162.197/

Mesos master

    http://51.141.162.197/mesos/#/
    
    http://51.141.162.197:5050
    (need to open port 5050)

Marathon

    http://51.141.162.197/marathon


Other

    azureuser@dcos-linuxa01-26652296-000001:~$ ps -ef | grep mesos

    erver_depth 10 -mesos_state ssl false
    root      36440      1  0 Nov14 ?        01:28:03 /opt/mesosphere/packages/mesos--aaedd03eee0d57f5c0d49c74ff1e5721862cad98/bin/mesos-agent
    root      36529      1  0 Nov14 ?        00:03:08 nginx: master process /opt/mesosphere/packages/adminrouter--0493a6fdaed08e1971871818e194aa4607df4f09/nginx/sbin/nginx -c /opt/mesosphere/packages/adminrouter--0493a6fdaed08e1971871818e194aa4607df4f09/nginx/conf/nginx.agent.conf
    azureuser@dcos-linuxa01-26652296-000001:~$ sudo kill 36440


    location for logging files on a Linux Agent node 

    ./var/lib/mesos/slave/
