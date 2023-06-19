#Skript zur Übung Cmdlet Get-ChildItem
#############
# Aufgabe 1 #
#############
Set-Location $env:userprofile\Downloads
New-Item -Type Directory App1
Set-Location App1

# 3 doc Dateien
1..3 | Foreach-Object { New-Item "file$(Get-Random).doc" }

# 7 docx Dateien
1..7 | Foreach-Object { New-Item "file$(Get-Random).docx" }

# 1 db Datei
New-Item "sqlite$(Get-Random).db"

# 3 jpg Dateien
1..3 | Foreach-Object { New-Item "image$(Get-Random).jpg" }

# 2 jpeg Dateien
1..2 | Foreach-Object { New-Item "image$(Get-Random).jpeg" }

#############
# Aufgabe 2 #
#############
Set-Location $env:userprofile\Downloads
New-Item -Type Directory App2
Set-Location App2
1..3 | Foreach-Object { New-Item -Type Directory "AppData2$_" }

# Ordner AppData21
Set-Location AppData21
New-Item "file$(Get-Random).doc"
New-Item "sqlite$(Get-Random).db"
New-Item "image$(Get-Random).jpg"
New-Item "file$(Get-Random).docx"
New-Item "file$(Get-Random).docx"
New-Item "image$(Get-Random).jpeg"
New-Item "image$(Get-Random).jpeg"
Set-Location ..

# Ordner AppData22
Set-Location AppData22
1..2 | Foreach-Object { New-Item "file$(Get-Random).doc" }
1..4 | Foreach-Object { New-Item "file$(Get-Random).docx" }
1..2 | Foreach-Object { New-Item "image$(Get-Random).jpg" }
Set-Location ..

# Ordner AppData23
Set-Location AppData23
New-Item "file$(Get-Random).docx" 