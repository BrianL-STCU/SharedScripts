﻿<#
.SYNOPSIS
Parses TSV clipboard data into objects.

.LINK
Get-Clipboard

.LINK
ConvertFrom-Csv

.EXAMPLE
Import-ClipboardTsv.ps1 |Format-Table -AutoSize

Name              Alias        Actor
----              -----        -----
Rita Farr         Elasti-Girl  April Bowlby
Larry Trainor     Negative Man Matt Bomer/Mathew Zuk
Kay Challis       Crazy Jane   Diane Guerrero
Cliff Steele      Robotman     Brendan Fraser/Riley Shanahan
Victor Stone      Cyborg       Joivan Wade
Dr. Niles Caulder The Chief    Timothy Dalton
Eric Morden       Mr. Nobody   Alan Tudyk
#>

#Requires -Version 3
[CmdletBinding()] Param(
# The field separator character.
[char] $Delimiter = "`t"
)
$data = Get-Clipboard
$data[1..($data.Length-1)] |
	ConvertFrom-Csv -Delimiter $Delimiter -Header ($data[0] -split $Delimiter)
