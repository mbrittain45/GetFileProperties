

# to load script call:		'. .\PSFileUtils.ps1'


# compress an archive
function Compress-Zip {
	
	<#
    .SYNOPSIS
        Compress a directory or files into a zip file.
    #>
    [CmdletBinding()]

    param (
        [string]$dirpath,
        [string]$zipname
	)

    begin {}

    process {
		Compress-Archive -Path $dirpath -DestinationPath $zipname -Force
    }

    end {}
}


# uncompress an archive
function Decompress-Zip {
	
	<#
    .SYNOPSIS
        Decompress a directory or files into a zip file.
    #>
    [CmdletBinding()]

    param (
        [string]$dirpath,
        [string]$zipname
	)

    begin {}

    process {
		Expand-Archive -Path $zipname -DestinationPath $dirpath -Force
	}

    end {}
}


# add history to commands
function AddCSV-CmdHistory {
	
	<#
    .SYNOPSIS
        Add command history from csv file.
    #>
    [CmdletBinding()]

    param (
        [string]$csvpath
	)

    begin {}

    process {
		$a = Import-Csv -Path $csvpath
		Add-History -InputObject $a -PassThru
	}

    end {}
}




# clear history of commands
function Remove-All-History {
	
	<#
    .SYNOPSIS
        Clear command history.
    #>
    [CmdletBinding()]

    param ()

    begin {}

    process {
		Clear-History
	}

    end {}
}



# clear windows/screen
function Clear-Screen {
	
	<#
    .SYNOPSIS
        Clear the screen or window.
    #>
    [CmdletBinding()]

    param ()

    begin {}

    process {
		Clear-Host
	}

    end {}
}


# todo: Connect-PSSession, Debug-Job, Disable-PSRemoting, Disable-PSRemoting, Disable-PSSessionConfiguration, Disconnect-PSSession, Enable-PSRemoting,
# Enable-PSSessionConfiguration, Enter-PSHostProcess, Enter-PSSession, Exit-PSHostProcess, Exit-PSSession, Export-ModuleMember,
# ForEach-Object, Get-Command, Get-Help, Get-History, Get-Job, Get-Module,  Get-PSHostProcessInfo, Get-PSSession, Get-PSSessionCapability, 
# Get-PSSessionConfiguration, Get-PSSubsystem, Import-Module, Invoke-Command, Invoke-History, New-Module, New-ModuleManifest, New-PSRoleCapabilityFile
# New-PSSession, New-PSSessionConfigurationFile, Out-Default, Out-Host, Receive-Job, Receive-PSSession, Register-ArgumentCompleter, 