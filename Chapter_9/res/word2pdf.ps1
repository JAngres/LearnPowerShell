param([String]$InFile)
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

$FileAbsolutePath=(Get-Item $InFile).FullName
$PdfFile=$FileAbsolutePath.Replace("docx","pdf")
$PdfDir=(Get-Item $InFile).DirectoryName

# convert MS Word file to PDF
$Word=New-Object -ComObject Word.Application

$Doc=$Word.Documents.Open($FileAbsolutePath)
$Doc.SaveAs([ref] $PdfFile, [ref] 17)
$Doc.Close()

# show notify icon in Windows info-center
$PdfInfoNote=New-Object System.Windows.Forms.NotifyIcon
$PdfInfoNote.Icon=[System.Drawing.SystemIcons]::Information
$PdfInfoNote.BalloonTipText="PDF $PdfFile wird erzeugt..."
$PdfInfoNote.Visible=$True
$PdfInfoNote.ShowBalloonTip(5000)

Start-Sleep -Milliseconds 2000

# show message box
[System.Windows.Forms.MessageBox]::Show("Datei $PdfFile wurde im Verzeichnis $PdfDir erstellt.","Word2PDF Konverter")
