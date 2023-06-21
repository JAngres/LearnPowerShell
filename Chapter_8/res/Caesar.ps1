#encode string w/ Caesar encryption
Function Encode-Caesar {
  param([string]$str)
  $str.ToUpper().ToCharArray() | ForEach-Object {
    $ord = ([byte][char]$_ - 65 + 3) % 26
    [char][byte]($ord + 65)
  }
}

#decode Casar-encrypted string
Function Decode-Caesar {
  param([string]$str)
  $str.ToUpper().ToCharArray() | ForEach-Object {
    $ord = ([byte][char]$_ - 65 - 3) % 26
    [char][byte]($ord + 65)
  }
}