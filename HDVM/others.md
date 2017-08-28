High Density Virtual Machines
=============================

Source code, documentation, tools for the HD-VM project.

Host setup
==========

Install a Windows `RS_ONECORE_CONTAINER` build (we use client).

Use an ISO from, for example:
`\\winbuilds\release\RS_ONECORE_CONTAINER\14955.1000.161020-1525\amd64fre\iso\iso_client_en-us`

> If installing as a Hyper-V VM, enabled nested virtualization with
> `Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true`

After setting up a user environment in the VM,
install Docker using the bootstrap scripts.

> Note that in this example, `<bin>` corresponds to
> `\\winbuilds\release\RS_ONECORE_CONTAINER\14955.1000.161020-1525\amd64fre\bin`

As an administrator:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
mkdir C:\containersetup
cd C:\containersetup
cp <bin>\vm\containersetup\* .
.\Install-ContainerHost.ps1
```

This script installs the latest master build of the Docker engine
(currently `Docker version 1.13.0-dev`).
Public instructions to do this manually are
[here](https://msdn.microsoft.com/en-us/virtualization/windowscontainers/quick_start/quick_start_windows_10).
Installing [Docker for Windows](https://docs.docker.com/docker-for-windows/)
does not install the necessary version;
the beta channel installs only 1.12,
and we need essentially the nightly build.

To demonstrate the Hyper-V isolation feature,
run `docker run --rm -it --isolation=hyperv microsoft/nanoserver cmd` .

Patch for Linux UtilityVM
=========================

This section details how to patch the Windows Hyper-V host for the Linux UtilityVM,
which is used for `--isolation=hyperv` Linux containers.

Double-click [`scripts/UtilityVMRegistries.reg`](scripts/UtilityVMRegistries.reg)
and install the debug registry keys.

Patch `vmwp.exe` with a copy found in `\\apollon\public\Soccerl\efi\PrivateVMWP\x64`.
Since this is a system library,
use `sfpcopy.exe` to overwrite it with our patched copy.

```powershell
cd C:\Windows\system32
cp \\hd-vm1\Public\utilities\sfpcopy.exe .
sfpcopy \\path\to\vmwp.exe vmwp.exe
sfpcopy \\path\to\vmwp.exe.mui en-us\vmwp.exe.mui
```

Reboot the system.

Load Linux UtilityVM image
==========================

We have a Linux UtilityVM (saved as a container)
with a custom bootloader, initial ramdisk, and kernel.
This section details how to load the image into Docker,
add the `porthole.exe` binary to your path,
import out PowerShell module,
and finally start and connect to the UtilityVM.

On Windows, in an administrative PowerShell session:

```powershell
docker load --input \\hd-vm1\Public\images\linux.tar

cp \\hd-vm1\Public\utilities\porthole.exe .
$env:PATH += ";$(Get-Location)"

Import-Module scripts\LaunchUtilityVM.psm1
Start-UtilityVM -Container linux
```

This should boot the UtilityVM and connect to it via `porthole`.
Stop the UtilityVM with `Stop-UtilityVM`,
which will kill the needed processes and restart services.
