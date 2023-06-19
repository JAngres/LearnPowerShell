# delete all files in a directory tree
# in debug mode only show file names instead of actually delete the files
Function Delete-FileTree($root)
{
  Get-ChildItem -Path $root -Recurse -Force | ForEach-Object { If (-not $_.PSIsContainer) { Write-Host "file $_" } }
}

