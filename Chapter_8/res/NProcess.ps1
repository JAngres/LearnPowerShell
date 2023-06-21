Function Get-FirstNProcess {
  param(
    [Parameter(Mandatory=$True)]
    [int]$Number
  )
  Get-Process | Select-Object -First $Number
}

