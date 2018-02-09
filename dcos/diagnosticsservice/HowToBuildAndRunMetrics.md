#Build

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

#Run

    .\dcos-metrics.exe -loglevel debug -role agent



