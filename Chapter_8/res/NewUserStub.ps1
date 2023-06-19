# stub to create user with username as $1 and password as $2 analogous to net user /add command
param(
  [string]$user,
  [string]$pass="asdf"
)

New-LocalUser -Name $user -Password $(ConvertTo-SecureString $pass -AsPlainText -Force)

Add-LocalGroupMember -Group Benutzer -Member $user
