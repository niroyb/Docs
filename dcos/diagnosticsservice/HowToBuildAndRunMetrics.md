# Build

        PS D:\github\src\github.com\dcos\dcos-metrics> .\scripts\build.ps1
        Script requires one or all of the parameters 'collector', 'statsd-emitter', and/or 'plugins'
        PS D:\github\src\github.com\dcos\dcos-metrics> .\scripts\build.ps1 collector statsd-emitter
        Remove-Item : Cannot find path 'D:\github\src\github.com\dcos\dcos-metrics\build' because it does not exist.
        At D:\github\src\github.com\dcos\dcos-metrics\scripts\build.ps1:106 char:1
        + Remove-Item .\build -Force -Recurse
        + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            + CategoryInfo          : ObjectNotFound: (D:\github\src\g...s-metrics\build:String) [Remove-Item], ItemNotFoundException
            + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.RemoveItemCommand

        Building: collector
        time="2018-02-08T18:10:09-08:00" level=info msg="Opening JSON metrics.avsc"
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 2): \"doc\": \"One or more named Datapoint values associated with a given topic, along with a list of zero or m
        ore metadata Tags.\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 7): \"doc\": \"The topic or 'channel' that this metric should be grouped into for subscription purposes. For ex
        ample, the service or framework that originated the metrics.\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 11): \"doc\": \"Labels which further identify or categorise the source of the metrics. For example, the service
         node that originated the metrics.\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 16): \"doc\": \"Metadatum associated with a list of Datapoints\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 34): \"doc\": \"A named record containing a floating point value associated with a timestamp.\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 39): \"doc\": \"User-visible label associated with these datapoints. This is unique per topic\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 43): \"doc\": \"Time that the event occurred, in milliseconds from the epoch (see logicalType)\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Skipping doc (row 48): \"doc\": \"A floating point value.\","
        time="2018-02-08T18:10:09-08:00" level=info msg="Git revision: d9f7341c9d68a243c4f4c2c288651ad9a6462728"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning MetricList['fields'][0]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning MetricList['fields'][1]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning Tag['fields'][0]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning Tag['fields'][1]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning MetricList['fields'][2]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning Datapoint['fields'][0]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning Datapoint['fields'][1]"
        time="2018-02-08T18:10:09-08:00" level=info msg="Scanning Datapoint['fields'][2]"
        time="2018-02-08T18:10:09-08:00" level=info msg="SUCCESS: Wrote preprocessed schema to ./metrics_schema/schema.go"
        PS D:\github\src\github.com\dcos\dcos-metrics> .\scripts\build.ps1 collector statsd-emitter
        Remove-Item : Cannot find path 'D:\github\src\github.com\dcos\dcos-metrics\build' because it does not exist.
        At D:\github\src\github.com\dcos\dcos-metrics\scripts\build.ps1:106 char:1
        + Remove-Item .\build -Force -Recurse
        + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            + CategoryInfo          : ObjectNotFound: (D:\github\src\g...s-metrics\build:String) [Remove-Item], ItemNotFoundException
            + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.RemoveItemCommand

        Building: collector
        time="2018-02-08T18:10:16-08:00" level=info msg="Opening JSON metrics.avsc"
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 2): \"doc\": \"One or more named Datapoint values associated with a given topic, along with a list of zero or m
        ore metadata Tags.\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 7): \"doc\": \"The topic or 'channel' that this metric should be grouped into for subscription purposes. For ex
        ample, the service or framework that originated the metrics.\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 11): \"doc\": \"Labels which further identify or categorise the source of the metrics. For example, the service
         node that originated the metrics.\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 16): \"doc\": \"Metadatum associated with a list of Datapoints\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 34): \"doc\": \"A named record containing a floating point value associated with a timestamp.\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 39): \"doc\": \"User-visible label associated with these datapoints. This is unique per topic\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 43): \"doc\": \"Time that the event occurred, in milliseconds from the epoch (see logicalType)\","
        time="2018-02-08T18:10:16-08:00" level=info msg="Skipping doc (row 48): \"doc\": \"A floating point value.\","
        time="2018-02-08T18:10:17-08:00" level=info msg="Git revision: d9f7341c9d68a243c4f4c2c288651ad9a6462728"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning MetricList['fields'][0]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning MetricList['fields'][1]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning Tag['fields'][0]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning Tag['fields'][1]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning MetricList['fields'][2]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning Datapoint['fields'][0]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning Datapoint['fields'][1]"
        time="2018-02-08T18:10:17-08:00" level=info msg="Scanning Datapoint['fields'][2]"
        time="2018-02-08T18:10:17-08:00" level=info msg="SUCCESS: Wrote preprocessed schema to ./metrics_schema/schema.go"
        Building: statsd-emitter
        Folder PATH listing for volume Data
        Volume serial number is 00000029 B6F0:767C
        D:\GITHUB\SRC\GITHUB.COM\DCOS\DCOS-METRICS\BUILD
        ├───collector
        │       dcos-metrics-collector-1.10.0-26-gd9f7341.exe
        │
        └───statsd-emitter
                dcos-metrics-statsd-emitter-1.10.0-26-gd9f7341.exe

        PS D:\github\src\github.com\dcos\dcos-metrics>
        

        C:\mesos>dir */s

         Directory of C:\mesos\bin

        02/09/2018  02:15 AM    <DIR>          .
        02/09/2018  02:15 AM    <DIR>          ..
        02/09/2018  02:15 AM               236 detect_ip.ps1
                       1 File(s)            236 bytes

        https://github.com/dcos/dcos-windows/blob/master/scripts/detect_ip.ps1

         Directory of C:\mesos\var\lib\dcos

        02/09/2018  02:18 AM    <DIR>          .
        02/09/2018  02:18 AM    <DIR>          ..
        02/09/2018  02:18 AM                38 cluster-id  <--- put in any guid
                       1 File(s)             38 bytes

        C:\mesos\var\lib\dcos>type cluster-id
        {9eca9442-06e5-4447-9b48-1378d37f931d}
             
        C:\mesos>        

# Run

        .\dcos-metrics.exe -loglevel debug -role agent
        curl http://10.0.0.5:61001/system/v1/metrics/containers
        curl http://10.0.0.5:61001/system/v1/metrics/v0/ping
        curl http://10.0.0.5:61001/system/v1/metrics/v0/node



# Test commands from Paul's machine

        dcos --help

        C:\mesos\bin>dcos node
                                     HOSTNAME                                  IP                        ID
        55216acs000000.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net  10.0.0.4  0a8542a4-01ce-4766-a50c-1153b409df99-S0

        C:\mesos\bin>dcos node metrics summary 0a8542a4-01ce-4766-a50c-1153b409df99-S0


        C:\mesos\bin>dcos node metrics details 0a8542a4-01ce-4766-a50c-1153b409df99-S0
        NAME                       VALUE      TAGS
        filesystem.capacity.used   32.96GiB   path: C:
        network.in.packets         0          interface: Loopback Pseudo-Interface 1
        memory.cached              0.00GiB
        cpu.cores                  2
        network.in.errors          0          interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        network.in.errors          0          interface: Loopback Pseudo-Interface 1
        filesystem.capacity.free   94.04GiB   path: C:
        network.in.packets         23859019   interface: Ethernet 3
        filesystem.inode.free      0          path: C:
        network.in                 0.00GiB    interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        filesystem.capacity.total  127.00GiB  path: C:
        network.out.packets        0          interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        network.out.errors         0          interface: Ethernet 3
        network.out.dropped        0          interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        memory.free                0.00GiB
        network.out.dropped        0          interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        network.in.packets         1874239    interface: vEthernet (HNS Internal NIC)
        network.out.dropped        0          interface: Ethernet 3
        network.in.dropped         0          interface: Loopback Pseudo-Interface 1
        process.count              97
        swap.total                 0.00GiB
        network.in.packets         0          interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        network.in.errors          0          interface: vEthernet (HNS Internal NIC)
        swap.used                  0.00GiB
        network.in                 2.25GiB    interface: Ethernet 3
        memory.total               7.00GiB
        filesystem.capacity.free   12.82GiB   path: D:
        network.out                0.85GiB    interface: Ethernet 3
        network.in                 0.00GiB    interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        network.in.dropped         0          interface: Ethernet 3
        network.out                0.00GiB    interface: Loopback Pseudo-Interface 1
        cpu.idle                   91.69%
        network.in.dropped         0          interface: vEthernet (HNS Internal NIC)
        network.out.packets        2596253    interface: vEthernet (HNS Internal NIC)
        network.in.errors          0          interface: Ethernet 3
        network.out.dropped        0          interface: Loopback Pseudo-Interface 1
        cpu.user                   6.00%
        network.out.errors         0          interface: vEthernet (HNS Internal NIC)
        network.in.errors          0          interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        cpu.wait                   0.00%
        network.out                0.00GiB    interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        network.out.errors         0          interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        swap.free                  0.00GiB
        network.out.packets        0          interface: Loopback Pseudo-Interface 1
        filesystem.inode.total     0          path: D:
        filesystem.inode.used      0          path: D:
        cpu.total                  8.31%
        network.in.dropped         0          interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        filesystem.capacity.total  14.00GiB   path: D:
        filesystem.inode.total     0          path: C:
        network.out                0.00GiB    interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        network.in                 0.00GiB    interface: Loopback Pseudo-Interface 1
        system.uptime              3111945
        network.out.packets        0          interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        cpu.system                 2.31%
        network.in.dropped         0          interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        network.in                 0.37GiB    interface: vEthernet (HNS Internal NIC)
        filesystem.inode.free      0          path: D:
        network.out.errors         0          interface: isatap.{C0FCD815-A6C2-4B5A-ACD3-502915E7D93D}
        memory.buffers             0.00GiB
        filesystem.inode.used      0          path: C:
        network.out.packets        19150338   interface: Ethernet 3
        network.out.dropped        0          interface: vEthernet (HNS Internal NIC)
        network.out.errors         0          interface: Loopback Pseudo-Interface 1
        network.out                0.69GiB    interface: vEthernet (HNS Internal NIC)
        network.in.packets         0          interface: isatap.5yrtti21qlzurg2gnvyfoqzc5h.dx.internal.cloudapp.net
        filesystem.capacity.used   1.18GiB    path: D:

        C:\mesos\bin>

        C:\mesos\bin>dcos node metrics summary 0a8542a4-01ce-4766-a50c-1153b409df99-S0
        CPU            MEM                DISK
        0.00 (12.86%)  7.00GiB (100.00%)  0.00GiB (0.00%)

        C:\mesos\bin>









