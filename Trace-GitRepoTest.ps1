﻿<#
.SYNOPSIS
Uses git bisect to search for the point in the repo history that the test script starts returning true.

.EXAMPLE
Trace-GitRepoTest.ps1 { dotnet build; !$? }

Searches the full repo history for the point at which the build broke.
#>

#Requires -Version 3
[CmdletBinding()] Param(
# A script block that returns a boolean corresponding to a state introduced at some point in the repo history.
[Parameter(Position=0,Mandatory=$true)][ScriptBlock] $TestScript,
# A commit from the repo history without the new state.
[Parameter(Position=1)][string] $GoodCommit = $(Get-GitFirstCommit.ps1),
# A commit from the repo history with the new state.
[Parameter(Position=2)][string] $BadCommit = $(git rev-parse HEAD)
)
git bisect start |Write-Verbose
git bisect good $GoodCommit |Write-Verbose
git bisect bad $BadCommit |Write-Verbose
do
{
	$state = if($TestScript.Invoke()) {'bad'} else {'good'}
	$result = git bisect $state
	$result |Write-Verbose
}
while($result |Select-String '\ABisecting: ')
git bisect reset |Write-Verbose
return $result
