
# Exmaple file for a DCOS job


        ID
        1
        DESCRIPTION
        Write a test file to some directory
        CPUS
        1
        MEMORY (MIB)
        128
        DISK SPACE (MIB)
        0
        COMMAND
        powershell -c " echo hi > C:\temp\b.txt"

        Schedule information

        CRON SCHEDULE:
          mm hour * * * 
          (45 15 * * * --> 3:45pm -->

        TimeZone
          America/Los_Angeles

        Starting deadline
           5
