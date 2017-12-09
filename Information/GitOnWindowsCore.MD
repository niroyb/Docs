# How to setup git environment on WindowsServierCore


1. Run 
  powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

2. choco install -y git

3.
  PS C:\Users\azureuser> choco install git-credential-winstore

  C:\Users\azureuser>
  
 4. generate ssh key under C:\Program Files\Git\usr\bin
 
    cd C:\Program Files\Git\usr\bin
    .\ssh-keygen.exe -t rsa -C "soccerl@microsoft.com"
   
    key can be found in c:\Users\azureuser\.ssh\id_rsa.pub

 5. add the SSH key to the repo settings
   
 6.  git clone https://github.com/soccerGB/Tools



Note:   
      https://stackoverflow.com/questions/46731433/how-to-download-and-install-git-client-for-window-using-powershell

      https://chocolatey.org/install

      Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).Dow
      nloadString('https://chocolatey.org/install.ps1'))
