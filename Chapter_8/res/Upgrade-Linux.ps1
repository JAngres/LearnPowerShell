Function Upgrade-System {
  param([switch]$Force=$False)
  If (-not $Force) {
    apt update && apt upgrade -y
  }
  Else {
    apt update && apt list --upgradable | ForEach-Object { If (-not $_.StartsWith("Auflistung")) { apt install $($_.Split('/')[0]) -y } }
  }
}