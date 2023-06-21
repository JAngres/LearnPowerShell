Function Get-GroupMemberships {
<#
  .SYNOPSIS
  list all group memberships of a user
  .DESCRIPTION 
  traverses all local groups and checks whether the queried user is a member
  .PARAMETER User
  the user whose group memberships are requested
#>
  param([string]$User)
  $UNCUser=$null
  If ($User.Contains('\')) {
    $UNCUser=$User
  }
  Else {
    $UNCUser="$env:computername\$User"
  }
  Get-LocalGroup | ForEach-Object { 
    If ((Get-LocalGroupMember -Group $_).Length -ne 0) {
      If ((Get-LocalGroupMember -Group $_).Name -eq $UNCUser) { 
        Write-Host "found $User in $_" 
      } 
    }
  }
}