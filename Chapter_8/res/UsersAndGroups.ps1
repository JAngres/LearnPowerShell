Function Get-UsersAndGroups {
  param([string]$User, [switch]$NoGroups)
  If ([string]::IsNullOrEmpty($User)) {
    Get-LocalUser | Format-Table -Property Name
  }
  Else {
    Get-LocalUser $User | Format-Table -Property Name
  }
  If (-not $NoGroups) {
    Get-LocalGroup | Format-Table -Property Name
  }
}