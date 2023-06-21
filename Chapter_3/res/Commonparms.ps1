# create structure for common parameter exercise
sl $Env:userprofile\Downloads
ni src -ItemType Directory
ni dest -ItemType Directory
ni src\a.txt 
ni src\ro.txt
sp src\ro.txt -Name IsReadOnly -Value $True
sl src