# list available USB drives
Function Get-UsbDrive {
  $drives=Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Name -ne "C" -and $_.Name -ne "Temp" }
  ForEach ($d in $drives) {
    Write-Output "found drive $($d.Name)"
  }
}

# ejecting USB drive
Function Remove-UsbDrive {
  param(
    [Parameter(Mandatory=$True)]
    [string]$Letter
  )
  $Letter="$Letter"+":"
  $drive = New-Object -comObject Shell.Application
  $drive.Namespace(17).ParseName("$Letter").InvokeVerb("Eject")
}