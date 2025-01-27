﻿<#
.SYNOPSIS
Adds a timespan to DateTime values.

.INPUTS
System.DateTime values to add the TimeSpan value to.

.OUTPUTS
System.DateTime values with the TimeSpan added.

.EXAMPLE
Get-Date |Add-TimeSpan.ps1 00:00:30

Adds 30 seconds to the current date and time value.
#>

#Requires -Version 3
[CmdletBinding()][OutputType([DateTime])] Param(
# The TimeSpan value to add.
[Parameter(Mandatory=$true)][TimeSpan]$TimeSpan,
# The DateTime value to add to.
[Parameter(Mandatory=$true,ValueFromPipeline=$true)][DateTime]$DateTime
)
Process{$DateTime.Add($TimeSpan)}
