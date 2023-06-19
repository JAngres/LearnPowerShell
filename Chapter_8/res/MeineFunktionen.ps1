Write-Host "Hier sind meine Funktionen gespeichert."

function Get-MyProcess 
{
    Get-Process -Name s* | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending
}

function Get-MyProcess2 ($FilterName = "s*", [switch]$Liste)
{
    <#
      .SYNOPSIS
      Prozesse filtern und sortieren
      .DESCRIPTION
      Sie geben einen Filter vor, der auf die gesuchten Prozesse angewendet wird.
      Es werden die Eigenschaften ID, ProcessName und CPU angezeigt.
      Es findet eine Sortierung nach der Eigenschaft CPU statt.
      .EXAMPLE
      Get-MyProcess2
      Ein Aufruf ohne Parameter führt die Funktion mit den definierten Standardwerten aus.
      .EXAMPLE
      Get-MyProcess2 -FilterName power*
      Hier wird nach Prozessen gefiltert, deren Name mit der zeichenfolge "power" beginnt.
      .EXAMPLE
      Get-MyProcess2 -FilterName power* -Liste
      Hier wird nach Prozessen gefiltert, deren Name mit der zeichenfolge "power" beginnt.
      Zusätzlich wird die Ausgabe in Form einer Liste vorgenommen.
      .PARAMETER FilterName
      Legt einen Filter für die auszuwählenden Prozesse fest, z.B. *host*, power* oder w*.
      .PARAMETER Liste
      Switch-Parameter für die Ausgabe als Liste. Wird der Parameter nicht angegeben, erfolgt die Ausgabe als Tabelle.
    #>
    If ($Liste)
    {
        Get-Process -Name $FilterName | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending | Format-List
    }
    Else
    {
        Get-Process -Name $FilterName | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending
    }
}

function Get-MyProcess3 ($FilterName = "s*")
{
    Get-Process -Name $FilterName | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending
}

filter Liste
{
    $_ | Format-List
}

function Optimize-Output
{
    Begin
    {
        Get-Date
    }
    Process
    {
        $_ | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending
    }
    End
    {
        Write-Host -ForegroundColor Black -BackgroundColor White "Aufgabe erledigt"
    }

}