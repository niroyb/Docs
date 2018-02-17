#[void]$global:script_path # A declaration



   

function Setup( 
           [string[]]$MasterAddress,
           [string]$AgentPrivateIP
        ) {
        [Uri]    $URLRewrite_Plugin_Uri  = 'http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi'
        [string] $URLRewrite_Plugin_File ="c:/dcos-download/rewrite_amd64_en-US.msi"

        [Uri]    $ARR_Plugin_Uri = "https://download.microsoft.com/download/E/9/8/E9849D6A-020E-47E4-9FD0-A023E99B54EB/requestRouter_amd64.msi"
        [string] $ARR_Plugin_File = "c:/dcos-download/requestRouter_amd64.msi"

        Write-Host "Setup AdminRouter : $script_path"; 
        
<#

	$RequiredComponents = @("Web-Server","Web-Mgmt-Tools","Web-Request-Monitor")

        Write-Host "Preinstalled state"; 

	foreach ($component in $RequiredComponents) {
		$queriedfeature = get-windowsfeature | where { $_.Name -like $component } 
	        Write-Output "$component is $queriedfeature.Installed"
	}

#
#        Write-Host "Removed all"; 

#	foreach ($component in $RequiredComponents) {
#		$queriedfeature = unInstall-windowsfeature $component 
#	        Write-Output "$component is $queriedfeature.Installed"
#	}
#
        Write-Host "Install all"; 

	foreach ($component in $RequiredComponents) {
		Write-Output "Making sure $component is installed"
		$feature = get-windowsfeature | where { $_.Name -like $element }
		if ($feature.InstallState -Eq "Installed")
	        {
		    Write-Host " 	$component was already installed"
	        }
        	else 
		{
		    Write-Host " $component was not installed yet"
		    Write-Host " 	Installing it now ..."
	  	    Install-WindowsFeature $component
		    Write-Host " 	installed ..."
		}
	}

        Write-Host "Check result"; 
	foreach ($component in $RequiredComponents) {
		$queriedfeature = get-windowsfeature | where { $_.Name -like $component } 
	        Write-Output "$component is $queriedfeature.Installed"
	}

        Write-Host "import-module WebAdministration"

        import-module WebAdministration

	New-Item -Path C:\dcos-download -ItemType directory -Force
#>
        Invoke-WebRequest -Uri $URLRewrite_Plugin_Uri -OutFile $URLRewrite_Plugin_File
        Start-Process $URLRewrite_Plugin_File  '/qn /l c:/tmp/rewrite.log' | Wait-Process

        if ($? -ne $true)
        {
            Write-Host "Could not install URL rewrite"
        } 

        Invoke-WebRequest -Uri $ARR_Plugin_Uri -OutFile $ARR_Plugin_File
        Start-Process $ARR_Plugin_File  '/qn /l c:/tmp/rewrite.log' | Wait-Process

        if ($? -ne $true)
        {
            Write-Host "Could not install Applcation Request Routing"
        } 

        # Now setup the adminrouter application

        $server_default_physicalpath = "c:\inetpub\wwwroot"


	$adminRouterPath="IIS:\AppPools\AdminRouter"
	$existed = Test-Path -Path $adminRouterPath
	if (! $existed -eq $True)
	{
		Write-Host "creating IIS:\AppPools\AdminRouter"
		$adminappgroup = new-item "IIS:\AppPools\AdminRouter" -Force
	}
        else
        {
		Write-Host "IIS:\AppPools\AdminRouter already existed"
        }

	Write-Host "Setting up new directory: $env:SystemDrive:\inetpub\wwwroot\DCOS"
        $adminrouter_dir = new-item -ItemType "Directory" "$env:SystemDrive:\inetpub\wwwroot\DCOS" -force

	Write-Host "Setting up new website at $agentPrivateIP"
        New-Website -Name "adminrouter" -Port 61001 -IPAddress $agentPrivateIP -PhysicalPath $adminrouter_dir -ApplicationPool "AdminRouter" -Force
        return $true
    }

    Write-Output "start setting up AdminRouter"

#    Setup("script_path", "192.168.255.5" , "10.0.0.5", $true)
    Setup -MasterAddress "192.168.255.5" -AgentPrivateIP "10.0.0.5"

    