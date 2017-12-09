
# Docker Pause : supported on Window Containers?

    Yes, but only Hyper-V containers can be paused, not the Windows Server Containers

    See [Docker pause Extended description](https://docs.docker.com/engine/reference/commandline/pause/#extended-description) for more information

    Experiment:
          PS C:\github> docker run -it generictest

          PS C:\github\Docs\docker> docker ps
          CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
          ed76c481d033        generictest         "cmd test.bat"      8 seconds ago       Up 4 seconds                            goofy_shaw
          PS C:\github\Docs\docker> docker pause goofy_shaw
          Error response from daemon: Cannot pause container ed76c481d033ef7426adbb4c6c71d4368c9dea055ac621018fbfbca74252ab6c: cannot pause Windows Server Containers
          PS C:\github\Docs\docker>
