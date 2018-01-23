
# A test run on the fetecher local files

- Deployment a DC/OS with RS3 build

- Prepare Slave machine

        RDP into a win slave and copy a zip file to c:\temp
        eg.
             Copy \\apollon\public\Soccerl\helper.zip to your slave machine’s c:\temp
             
        ps.This zip file contains only one file, LocateProxyAndSetEnv.ps1.

- Schedule a DC/OS service
                  
        Example job:
        
              https://github.com/soccerGB/Docs/blob/master/dcos/dcosDeployment/JobSamples/Rs3FetcherJob.md

              Once running, go to next step

- Go to the  Win slave machine 

        Check the result:

          PS C:\Users\azureuser> docker images
          REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
          microsoft/windowsservercore   1709                9458f3e79488        3 months ago        5.39GB
          microsoft/nanoserver          1709                17e7aa2027ea        3 months ago        236MB

          // list the running container from the service shcheduled earlier
          PS C:\Users\azureuser> docker ps
          CONTAINER ID        IMAGE                              COMMAND                  CREATED             STATUS              PORTS                                          NAMES
          1ea39244eb01        microsoft/windowsservercore:1709   "cmd /c 'ping -t 1..."   22 seconds ago      Up 16 seconds       0.0.0.0:80->80/tcp, 0.0.0.0:31920->31920/tcp   mesos-76f3574e-9ea2-4bd7-817e-2c6a5b16192a

          PS C:\Users\azureuser> docker container inspect 1ea39244eb01
          [
              {
                  "Id": "1ea39244eb012373b0de124ec23d452b692ce4d8478afb3c66cb011fe27f8e37",
         …
                      "NetworkMode": "nat",
                      "PortBindings": {
                          "31920/tcp": [
                              {
                                  "HostIp": "",
                                  "HostPort": "31920"
                              }
                          ],
                          "80/tcp": [
                              {
                                  "HostIp": "",
                                  "HostPort": "80"
                              }
                          ]
                      },
          …
                  },
                  "Mounts": [
                      {
                          "Type": "bind",
                          "Source": "c:\\dcos\\mesos\\work\\slaves\\f1530171-6a64-41e2-970a-6168c291716b-s4\\docker\\links\\76f3574e-9ea2-4bd7-817e-2c6a5b16192a",
                          "Destination": "c:\\mesos\\sandbox",
                          "Mode": "",
                          "RW": true,
                          "Propagation": ""
                      }
                  ],
          ….
                  }
              }
          ]

   // Attach into the container 
   
          PS C:\Users\azureuser> docker exec -it  1ea39244eb01 cmd

  // we are inside the container 
  
          C:\>dir

           Volume in drive C has no label.
           Volume Serial Number is 9402-6708

           Directory of C:\

          09/29/2017  05:34 PM             1,894 License.txt
          01/23/2018  03:01 AM    <DIR>          mesos
          09/29/2017  12:28 PM    <DIR>          PerfLogs
          10/12/2017  04:43 PM    <DIR>          Program Files
          09/29/2017  12:28 PM    <DIR>          Program Files (x86)
          10/12/2017  04:44 PM    <DIR>          Users
          10/12/2017  04:42 PM    <DIR>          Windows
                         1 File(s)          1,894 bytes
                         6 Dir(s)  21,142,515,712 bytes free

          C:\>cd mesos

          C:\mesos>dir
           Volume in drive C has no label.
           Volume Serial Number is 9402-6708

           Directory of C:\mesos

          01/23/2018  03:01 AM    <DIR>          .
          01/23/2018  03:01 AM    <DIR>          ..
          01/23/2018  03:01 AM    <SYMLINKD>     sandbox [\\?\ContainerMappedDirectories\12BBCAB9-1525-404C-AFC7-52AD46A2E4CC]
                         0 File(s)              0 bytes
                         3 Dir(s)  21,142,515,712 bytes free

          C:\mesos>cd sandbox

          C:\mesos\sandbox>dir
           Volume in drive C has no label.
           Volume Serial Number is 9402-6708

           Directory of C:\mesos\sandbox

          01/23/2018  03:01 AM    <DIR>          .
          01/23/2018  03:01 AM    <DIR>          ..
          12/02/2017  10:52 PM               593 helper.zip  
          12/01/2017  02:44 PM             1,346 LocateProxyAndSetEnv.ps1
          01/23/2018  03:01 AM                 0 stderr
          01/23/2018  03:01 AM                 0 stdout
                         4 File(s)          1,939 bytes
                         2 Dir(s)  24,733,237,248 bytes free

          C:\mesos\sandbox>

          helper.zip was unzipped into a host share before being mapped into container's C:\mesos\sandbox
          
- Da da! This shows fetcher for local file works!
