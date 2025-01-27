﻿<#
.SYNOPSIS
Creates local variables from a data row or dictionary (hashtable).

.INPUTS
System.Collections.IDictionary with keys and values to import as variables,
or System.Management.Automation.PSCustomObject with properties to import as variables.

.LINK
Add-ScopeLevel.ps1

.EXAMPLE
if($line -match '\AProject\("(?<TypeGuid>[^"]+)"\)') {Import-Variables.ps1 $Matches}

Copies $Matches.TypeGuid to $TypeGuid if a match is found.

.EXAMPLE
Invoke-Sqlcmd "select ProductID, Name, ListPrice from Production.Product where ProductID = 1;" -Server 'Server\instance' -Database AdventureWorks |Import-Variables.ps1

Copies field values into $ProductID, $Name, and $ListPrice.

.EXAMPLE
if($env:ComSpec -match '^(?<ComPath>.*?\\)(?<ComExe>[^\\]+$)'){Import-Variables.ps1 $Matches -Verbose}

Sets $ComPath and $ComExe from the regex captures if the regex matches.

.EXAMPLE
Invoke-RestMethod https://api.github.com/ |Import-Variables.ps1 ; Invoke-RestMethod $emojis_url

Sets variables from the fields returned by the web service: $current_user_url, $emojis_url, &c.
Then fetches the list of GitHub emojis.
#>

#Requires -Version 3
[CmdletBinding()][OutputType([void])] Param(
<#
A hash of string names to any values to set as variables,
or a DataRow or object with properties to set as variables.
Works with DataRows.
#>
[Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$true)][PSObject] $InputObject,
# The type of object members to convert to variables.
[Alias('Type')][Management.Automation.PSMemberTypes] $MemberType = 'Properties',
# The scope of the variables to create.
[string] $Scope = 'Local',
# Indicates that created variables should be hidden from child scopes.
[switch] $Private
)
Begin
{
	$Scope = Add-ScopeLevel.ps1 $Scope
	$sv = if($Private) {@{Scope=$Scope;Option='Private'}} else {@{Scope=$Scope}}
}
Process
{
    $isDict = $InputObject -is [Collections.IDictionary]
    [string[]]$vars =
        if($isDict) {$InputObject.Keys |? {$_ -is [string]}}
        else {Get-Member -InputObject $InputObject -MemberType $MemberType |% Name}
    if(!$vars){return}
    Write-Verbose "Importing $($vars.Count) $(if($isDict){'keys'}else{"$MemberType properties"}): $vars"
    foreach($var in $vars) {Set-Variable $var $InputObject.$var @sv}
}
