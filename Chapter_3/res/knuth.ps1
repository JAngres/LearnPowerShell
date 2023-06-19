# Task: Read a text file, determine the n most frequently used words
#       and print out a sorted list of those words along with their
#       frequencies

# UNIX shell solution by Doug McIlroy:
# tr -cs A-Za-z '\n' |
# tr A-Z a-z |
# sort |
# uniq -c |
# sort -rn |
# sed ${1}q

# PowerShell solution
#(Get-Content .\words.txt) -Split '\W' | Group-Object -NoElement | Sort-Object -Property Count -Descending | Select-Object -First $Args[0]

# in short
(gc .\words.txt) -Split '\W+' | group -no | sort Count -d | select -f $Args[0]