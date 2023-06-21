# A functional style Caesar encryption w/ scriptblocks

# used scriptblocks as global variables
[scriptblock]$format = { $_.ToUpper().ToCharArray() }
[scriptblock]$enc_ord = { ([byte][char]$_ - 65 + 3) % 26 }
[scriptblock]$dec_ord = { ([byte][char]$_ - 65 - 3) % 26 }
[scriptblock]$chr = { [char][byte]($_ + 65) }

# encryption function
Function Encrypt {
  param([string]$str)
  $str | % $format | % $enc_ord | % $chr
}

#decryption function
Function Decrypt {
  param([string]$str)
  $str | % $format | % $dec_ord | % $chr
}
