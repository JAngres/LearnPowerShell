Function Set-NtfsPermissions {
<#
  .SYNOPSIS
  configure NTFS permissions for a folder
  .DESCRIPTION 
  sets desired NTFS permissions for an existing object or an object that is to be created
  .PARAMETER Folder
  the folder the permissions of which are to be created resp. updated
  .PARAMETER BreakInheritence
  breaking up existing inherited permissions is disabled by default
  .PARAMETER FA
  list of comma separated principals to grant them FullAccess
  .PARAMETER MA
  list of comma separated principals to grant them ModifyAcess
  .PARAMETER RA
  list of comma separated principals to grant them ReadAccess
#>
  param([string]$Folder, 
        [switch]$BreakInheritence=$False,
        [array]$FA,
        [array]$MA,
        [array]$RA)
  
   # create directory if it doesn't exist
  If (-not (Test-Path $Folder)) {
    New-Item -Name $Folder -ItemType Directory | Out-Null
  }

  # get current ACL of file system object
  $acl = Get-Acl -Path $Folder

  # break inheritence and deleted inherited permissions if desired
  If ($BreakInheritence) {
    $acl.SetAccessRuleProtection($True, $False)
  }

  # set FA permissions
  If ($FA.Count -ne 0) {
    ForEach ($principal in $FA.Split(',')) {
      $rule=New-Object System.Security.AccessControl.FileSystemAccessRule("$principal","FullControl","ContainerInherit, ObjectInherit","None","Allow")
      $acl.AddAccessRule($rule)
    }
  }

  # set MA permissions
  If ($MA.Count -ne 0) {
    ForEach ($principal in $MA.Split(',')) {
      $rule=New-Object System.Security.AccessControl.FileSystemAccessRule("$principal","Modify","ContainerInherit, ObjectInherit","None","Allow")
      $acl.AddAccessRule($rule)
    }
  }

  # set RA permissions
  If ($RA.Count -ne 0) {
    ForEach ($principal in $RA.Split(',')) {
      $rule=New-Object System.Security.AccessControl.FileSystemAccessRule("$principal","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
      $acl.AddAccessRule($rule)
    }
  }

  # write updated ACL to file system object
  Set-Acl -Path $Folder -AclObject $acl
}