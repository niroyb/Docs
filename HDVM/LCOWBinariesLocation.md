# [Linux Containers on Windows Selfhost](https://osgwiki.com/wiki/Linux_Containers_on_Windows_Selfhost)

create C:\Program Files\Linux Containers and copy: 

initrd.img from \\sesdfs\1Windows\TestContent\CORE\Base\HYP\VMC\Containers\LCOW\Integration\Linux\Kernel

bootx64.efi from \\sesdfs\1Windows\TestContent\CORE\Base\HYP\VMC\Containers\LCOW\Integration\Linux\Kernel

Docker

$env:LCOW_SUPPORTED=1

dockerd --data-root c:\lcow --experimental -D 

Try pulling and starting a container docker run --rm busybox echo hello


# LCOW Jenkins binary destination folder

\\redmond\wsscfs\OSTC-Public\Builds
