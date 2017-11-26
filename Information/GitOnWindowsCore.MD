# How to setup git environment from WindowsServierCore

  https://stackoverflow.com/questions/46731433/how-to-download-and-install-git-client-for-window-using-powershell
  
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).Dow
  nloadString('https://chocolatey.org/install.ps1'))

  choco install -y git

  PS C:\Users\azureuser> choco install git-credential-winstore

  C:\Users\azureuser>
  cd C:\Program Files\Git\usr\bin
  .\ssh-keygen.exe -t rsa -C "soccerl@microsoft.com"
  
  git clone https://github.com/soccerGB/Tools

