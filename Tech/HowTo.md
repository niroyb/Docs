# How to enable nested VM in Hyper-V

From the host, in an elevated Powershell windows, run the following commands after you shutdown the VM
Set-VMNetworkAdapter -VMName yourVMName -MacAddressSpoofing On
Set-VMProcessor -VMName yourVMName -ExposeVirtualizationExtensions $true
