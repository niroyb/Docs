
# [How to build binaries for Mesos Windows agent noded ](https://github.com/apache/mesos/blob/master/docs/windows.md)

      Short cheat sheet

      # Clone (or extract) Mesos.
      git clone https://git-wip-us.apache.org/repos/asf/mesos.git
      cd mesos

      # Configure using CMake for an out-of-tree build.
      mkdir build
      cd build
      cmake .. -G "Visual Studio 15 2017 Win64" -T "host=x64" -DENABLE_LIBEVENT=1

      # Build Mesos.
      # To build just the Mesos agent, add `--target mesos-agent`.
      cmake --build .

      or 
      cmake --build . --target mesos-agent

      Built binaries could be found in .\src 


