﻿<#
.SYNOPSIS
Serializes complex content into XML elements.

.INPUTS
System.Object (any object) to serialize.

.OUTPUTS
System.String for each XML-serialized value or property.

.EXAMPLE
ConvertTo-XmlElements.ps1 @{html=@{body=@{p='Some text.'}}}

<html><body><p>Some text.</p></body></html>

.EXAMPLE
[pscustomobject]@{UserName=$env:USERNAME;Computer=$env:COMPUTERNAME} |ConvertTo-XmlElements.ps1

<Computer>COMPUTERNAME</Computer>
<UserName>username</UserName>

.EXAMPLE
Get-ChildItem *.txt |ConvertTo-XmlElements.ps1

<PSPath>Microsoft.PowerShell.Core\FileSystem::C:\temp\test.txt</PSPath>
<PSParentPath>Microsoft.PowerShell.Core\FileSystem::C:\scripts</PSParentPath>
<PSChildName>test.txt</PSChildName>
<PSDrive></PSDrive>
<PSProvider></PSProvider>
<VersionInfo><FileVersionRaw></FileVersionRaw>
<ProductVersionRaw></ProductVersionRaw>
…
#>

#Requires -Version 3
[CmdletBinding()][OutputType([string])] Param(
<#
A hash or XML element or other object to be serialized as XML elements.

Each hash value or object property value may itself be a hash or object or XML element.
#>
[Parameter(Position=0,ValueFromPipeline=$true)] $Value
)
Begin {$Script:OFS = "`n"}
Process
{
    if($null -eq $Value) {}
    elseif($Value -is [Array])
    { $Value |ConvertTo-XmlElements.ps1 }
    elseif([bool],[byte],[DateTimeOffset],[decimal],[double],[float],[guid],[int],[int16],[long],[sbyte],[timespan],[uint16],[uint32],[uint64] -contains $Value.GetType())
    { [Xml.XmlConvert]::ToString($Value) }
    elseif($Value -is [datetime])
    { [Xml.XmlConvert]::ToString($Value,'yyyy-MM-dd\THH:mm:ss') }
    elseif($Value -is [string] -or $Value -is [char])
    { [Net.WebUtility]::HtmlEncode($Value) }
    elseif($Value -is [Hashtable] -or $Value -is [Collections.Specialized.OrderedDictionary])
    { $Value.Keys |? {$_ -match '^\w+$'} |% {"<$_>$(ConvertTo-XmlElements.ps1 $Value.$_)</$_>"} }
    elseif($Value -is [PSObject])
    {
        $Value |
            Get-Member -MemberType Properties |
            ? Name -NotLike '\W' |
            % Name |
            % {"<$_>$(ConvertTo-XmlElements.ps1 $Value.$_)</$_>"}
    }
    elseif($Value -is [xml])
    { $Value.OuterXml }
    else
    {
        $Value |
            Get-Member -MemberType Properties |
            ? Name -NotLike '\W' |
            % Name |
            % {"<$_>$(ConvertTo-XmlElements.ps1 $Value.$_)</$_>"}
    }
}
