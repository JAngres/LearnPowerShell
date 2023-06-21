<#
14-15 Puzzle in Powershell
1-dimensional version where the board is represented by a list
#>

# ! Option Constant requires new powershell session upon change
New-Variable -Name rsize -Value 4 -Option Constant
$bsize = $rsize * $rsize

New-Variable -Name shuffleMovesNum -Value 100 -Option Constant

$board = @(1..$bsize)

# print the board

function printBoard {
    Clear-Host
    for ($i = 0; $i -lt $bsize; $i++)
    {
        $cur = $board[$i]
        if ($cur -eq $bsize) { Write-Host " # " -NoNewline }
        elseif ($cur -lt 10) { Write-Host (" " + $cur + " ") -NoNewline }
        else { Write-Host (" " + $cur) -NoNewline }
        if ($i % $rsize -eq $rsize - 1) { Write-Host }
    }
}

# return position of hash
function hashPos {
    for ($i = 0; $i -lt $bsize; $i++)
    {
        if ($board[$i] -eq $bsize) { return $i }
    }
}

# check if board is sorted
function isSorted {
    for ($i = 0; $i -lt $bsize; $i++)
    {
        if ($board[$i] -ne $i + 1) { return $false }
    }
    return $true
}

# shuffle initial board with 100 random moves
# prevent that a move is directly made undone by a special metric
function shuffle {
    $last = 0
    for ($i = 0; $i -lt $shuffleMovesNum; $i++)
    {
        $cur = Get-Random -Minimum 0 -Maximum 3
        if ([Math]::Abs($cur - $last) -ne 2)
        {
            switch($cur)
            {
                0 { moveUp }
                1 { moveLeft }
                2 { moveDown }
                3 { moveRight }
            }
            $last = $cur
        }
    }
}

# move up
function moveUp {
    $pos = hashPos
    if ($pos -gt $rsize - 1)
    {
        $board[$pos] = $board[$pos - $rsize]
        $board[$pos - $rsize] = $bsize
    }
}

# move down
function moveDown {
    $pos = hashPos
    if ($pos -lt $bsize - $rsize)
    {
        $board[$pos] = $board[$pos + $rsize]
        $board[$pos + $rsize] = $bsize
    }
}

# move left
function moveLeft {
    $pos = hashPos
    if ($pos % $rsize -ne 0)
    {
        $board[$pos] = $board[$pos - 1]
        $board[$pos - 1] = $bsize
    }
}

# move right
function moveRight {
    $pos = hashPos
    if ($pos % $rsize -ne $rsize - 1)
    {
        $board[$pos] = $board[$pos + 1]
        $board[$pos + 1] = $bsize
    }
}

# get user move
function getMove {
    $action = Read-Host "Enter direction [w a s d] (q to quit)"
    switch ($action)
    {
        "w" { moveUp }
        "a" { moveLeft }
        "s" { moveDown }
        "d" { moveRight }
        "q" { exit }
        Default { Write-Host "invalid move" }
    }
}

# main program loop
$numMoves = 0
shuffle
do 
{
    printBoard
    getMove
    $numMoves++
} until (isSorted)
printBoard
Write-Host ("You won with " + $numMoves + " moves.")