﻿<#
.SYNOPSIS
Adds a NoteProperty to a PSObject, calculating the value with the object in context.

.DESCRIPTION
The Add-Member cmdlet can either add a property with a single static value to objects
in the pipeline, or add a script property to objects which executes each time it's used.

This adds a static value to each object, but calculated from each object.

.LINK
Add-Member

.EXAMPLE
Get-ChildItem Get-*.ps1 |Add-NoteProperty.ps1 Size {Format-ByteUnits.ps1 $Length -Precision 1} -Properties Length -PassThru |Format-Table Size,Name -AutoSize

Size   Name
----   ----
8.1KB  Get-AspNetEvents.ps1
840    Get-AssemblyFramework.ps1
38.3KB Get-CharacterDetails.ps1
1.1KB  Get-ClassicAspEvents.ps1
1.3KB  Get-CommandPath.ps1
1.2KB  Get-ConfigConnectionStringBuilders.ps1
4.9KB  Get-ConsoleColors.ps1
1.4KB  Get-ContentSecurityPolicy.ps1
617    Get-Dns.ps1
2.4KB  Get-EnumValues.ps1
6KB    Get-IisLog.ps1
1.9KB  Get-LibraryVulnerabilityInfo.ps1
2.7KB  Get-DotNetFrameworkVersions.ps1
969    Get-RepoName.ps1
3.3KB  Get-SslDetails.ps1
4.2KB  Get-SystemDetails.ps1
6.8KB  Get-TypeAccelerators.ps1
1.2KB  Get-XmlNamespaces.ps1
#>

[CmdletBinding()][OutputType([void],[psobject])] Param(
# The name of the NoteProperty to add to the object.
[Parameter(Position=0,Mandatory=$true)][string] $Name,
# The expression to use to set the value of the NoteProperty.
[Parameter(Position=1,Mandatory=$true)][ScriptBlock] $Value,
# Properties of the input object to include as variables in the script block scope.
[Alias('Import')][string[]] $Properties = @(),
# The object to add the NoteProperty to.
[Parameter(ValueFromPipeline=$true,Mandatory=$true)][PSObject] $InputObject,
<#
Returns the object with the NoteProperty added.
Normally there is no output.
#>
[switch] $PassThru,
# Overwrite an existing property.
[switch] $Force
)
Process
{
	[psvariable[]] $context = New-Object psvariable _,$InputObject
	if($Properties -and $Properties.Length)
	{
		if($Properties[0] -eq '*')
		{
			$context += $InputObject.PSObject.Properties |
				ForEach-Object {New-Object psvariable $_.Name,$_.Value}
		}
		else
		{
			$context += $InputObject.PSObject.Properties |
				Where-Object Name -in $Properties |
				ForEach-Object {New-Object psvariable $_.Name,$_.Value}
		}
	}
	$v = $Value.InvokeWithContext($null,$context,$null) |Select-Object -First 1
	Add-Member -InputObject $InputObject -MemberType NoteProperty -Name $Name `
		-Value $v -PassThru:$PassThru -Force:$Force
}
