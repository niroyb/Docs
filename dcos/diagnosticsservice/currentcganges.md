
        PS D:\github\src\github.com\dcos\dcos-diagnostics> govendor fetch github.com/dcos/dcos-go/dcos@2ea27a8b570e0273245d2e6ef7b04b26b78b7cbe
        PS D:\github\src\github.com\dcos\dcos-diagnostics> govendor fetch github.com/dcos/dcos-go/dcos/nodeutil@9604451b7bdc14f3634699788b829a6e5550200c


        Changes not staged for commit:
          (use "git add <file>..." to update what will be committed)
          (use "git checkout -- <file>..." to discard changes in working directory)

                modified:   api/diagnostics.go
                modified:   api/handlers.go
                modified:   api/health.go
                modified:   api/helpers.go
                modified:   api/router.go
                modified:   cmd/check.go
                modified:   cmd/daemon.go
                modified:   cmd/root.go
                modified:   vendor/github.com/dcos/dcos-go/dcos/constants.go
                modified:   vendor/github.com/dcos/dcos-go/dcos/nodeutil/util.go

        Untracked files:
          (use "git add <file>..." to include in what will be committed)

                dcos-diagnostics.exe

        no changes added to commit (use "git add" and/or "git commit -a")

        PS D:\github\src\github.com\dcos\dcos-diagnostics\vendor\github.com\dcos\dcos-go> git diff dcos/constants.go
        diff --git a/vendor/github.com/dcos/dcos-go/dcos/constants.go b/vendor/github.com/dcos/dcos-go/dcos/constants.go
        index afee1d5..50cb9d3 100644
        --- a/vendor/github.com/dcos/dcos-go/dcos/constants.go
        +++ b/vendor/github.com/dcos/dcos-go/dcos/constants.go
        @@ -15,7 +15,8 @@ const (
         // DC/OS files.
         const (
                // FileDetectIP is a shell script on every DC/OS node which provides IP address used by mesos.
        -       FileDetectIP = "/opt/mesosphere/bin/detect_ip"
        +       //FileDetectIP = "/opt/mesosphere/bin/detect_ip"
        +       FileDetectIP = "c:\\mesos\\bin\\detect_ip.ps1"
         )

         // DC/OS DNS records.
        PS D:\github\src\github.com\dcos\dcos-diagnostics\vendor\github.com\dcos\dcos-go> git diff dcos/nodeutil/util.go
        diff --git a/vendor/github.com/dcos/dcos-go/dcos/nodeutil/util.go b/vendor/github.com/dcos/dcos-go/dcos/nodeutil/util.go
        index 9792fab..52e312a 100644
        --- a/vendor/github.com/dcos/dcos-go/dcos/nodeutil/util.go
        +++ b/vendor/github.com/dcos/dcos-go/dcos/nodeutil/util.go
        @@ -22,7 +22,9 @@ import (
         const (
                defaultExecTimeout       = 10 * time.Second
                defaultClusterIDLocation = "/var/lib/dcos/cluster-id"
        -       defaultBashPath          = "/bin/bash"
        +       //defaultBashPath          = "/bin/bash"
        +
        +       defaultBashPath = "powershell.exe"
         )

         var defaultStateURL = url.URL{
        PS D:\github\src\github.com\dcos\dcos-diagnostics\vendor\github.com\dcos\dcos-go>
