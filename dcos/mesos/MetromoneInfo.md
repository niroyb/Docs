

[Metronome](https://github.com/dcos/metronome/tree/4336d5b15cdd19be4088cd0d68268c5f9b96fc4d)

How to build


- Install sbt

      http://www.scala-sbt.org/0.13/docs/Installing-sbt-on-Linux.html

      echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
      sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
      sudo apt-get update
      sudo apt-get install sbt
    
    
- Enlist and build

      git clone https://github.com/dcos/metronome.git
      cd metronome
      sbt universal:packageBin
