
# allow this script to run:
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Define a target Path parameter
param(
    [string]$path = ""
)

$split_path = Split-Path $path


# get providers
#Get-PSProvider

# show file name
Write-Host "Input File: = $path : $split_path" 

# get path properties
Get-ItemProperty -Path $path
 
# get path property members
Get-Item $path | Get-Member -MemberType Property

# get all propeties
Get-Item $path | Select-Object -Property *

# get item properties
Get-ItemProperty -Path $path | Format-list -Property * -Force

# get member props
Get-ItemProperty -Path $path | Get-Member -MemberType property



 
 
$shell = New-Object -ComObject Shell.Application
$folder = $shell.Namespace((Split-Path $path))
$file = $folder.ParseName((Split-Path $path -Leaf))

Write-Host "Get File Properties: " 

# Loops through all 300+ possible metadata fields and returns populated ones
0..350 | ForEach-Object {

    $name  = $folder.GetDetailsOf($null, $_)
    $value = $folder.GetDetailsOf($file, $_)

    if ($name -and $value) {
        [PSCustomObject]@{
            ID    = $_
            Name  = $name
            Value = $value
        }
    }
}


