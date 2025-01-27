﻿<#
.SYNOPSIS
Opens a comic's PreviewsWorld page.

.EXAMPLE
Find-Comics.ps1 -Creator 'Grant Morrison' |Open-Comic.ps1

(Opens any upcoming Grant Morrison comics in your browser.)
#>

#Requires -Version 3
[CmdletBinding()] Param(
# The Diamond distribution ID for the comic.
[Parameter(Position=0,Mandatory=$true,ValueFromPipelineByPropertyName=$true,ValueFromRemainingArguments=$true)]
[Alias('Id','diamond_id')][string] $DiamondId
)
Process { Start-Process "https://www.previewsworld.com/Catalog/$DiamondId"; Start-Sleep -Milliseconds 200 }
