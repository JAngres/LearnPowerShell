#-------------------------------------------------#
# Zahlenraten					                  #
# (c) Julius Angres, 2022			              #
#-------------------------------------------------#

Add-Type -AssemblyName System.Speech

[int]$guess = 0
[int]$attempt = 0
[int]$number = Get-Random -Minimum 1 -Maximum 100

$voice = New-Object System.Speech.Synthesis.SpeechSynthesizer
$voice.Speak("Moin! Lass uns spielen!
              Ich denke mir eine Zahl zwischen eins und hundert. Ich gebe dir 7 Versuche sie zu erraten.") 

do {
    $voice.SpeakAsync("Welche Zahl nimmst du?") | Out-Null

    try {
        $guess = Read-Host "Welche Zahl nimmst du?"

        if ($guess -lt 1 -or $guess -gt 100) {
            throw
        }
    }
    catch {
        $voice.Speak("Die Zahl ist ungültig")
        continue
    }

    if ($guess -lt $number) {
        $voice.Speak("Zu niedrig!")
    }
    elseif ($guess -gt $number) {
        $voice.Speak("Zu hoch!")
    }

    $attempt += 1
} until ($guess -eq $number -or $attempt -eq 7)

if ($guess -eq $number) {
    $voice.Speak("Super! Du hast die Zahl erraten!")
}
else {
    $voice.Speak("Leider verloren! Vielleicht hast du nächstes Mal mehr Glück!
                  Meine gedachte Zahl war $number")
}