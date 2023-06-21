<#
Script for sending mails via powershell
Input of credentials with pop-up window
#>
Send-MailMessage `
-To “julius.angres@outlook.de” `
-From “ANR” `
-Subject “Hey, Julius” `
-Body “Some important plain text!” `
-Credential (Get-Credential) `
-SmtpServer “smtp.ionos.de” `
-Port 587
-UseSSL