﻿<#
.SYNOPSIS
Saves the permissions of found certificates to a file.

.LINK
Find-Certificate.ps1

.EXAMPLE
Save-CertificatePermissions.ps1 certperms.txt $issuername FindByIssuerName

Saves the any certs issued by $issuername to certperms.txt.
#>

#Requires -Version 3
[CmdletBinding()][OutputType([void])] Param(
# The file to same the permissions to.
[Parameter(Position=0,Mandatory=$true)][string]$FilePath,
<#
The value to search for, usually a string.

For a FindType of FindByTimeValid, FindByTimeNotYetValid, or FindByTimeExpired, the FindValue must be a datetime.
For a FindType of FindByApplicationPolicy or FindByCertificatePolicy, the FindValue can be a string or a
System.Security.Cryptography.Oid.
For a FindType of FindByKeyUsage, the FindValue can be a string or an int bitmask.
#>
[Parameter(Position=1,Mandatory=$true)][Alias('Certificate','Value')]$FindValue,
<#
The field of the certificate to compare to FindValue.
e.g. FindBySubjectName, FindByKeyUsage, FindByIssuerDistinguishedName

For a FindType of FindByTimeValid, FindByTimeNotYetValid, or FindByTimeExpired, the FindValue should be a datetime.
For a FindType of FindByApplicationPolicy or FindByCertificatePolicy, the FindValue can be a string or a
System.Security.Cryptography.Oid.
For a FindType of FindByKeyUsage, the FindValue can be a string or an int bitmask.

Omitting a FindType or StoreName will search all stores and common fields.
#>
[Parameter(Position=2)][Alias('Type','Field')][Security.Cryptography.X509Certificates.X509FindType]$FindType,
<#
The name of the certificate store to search.
e.g. My, TrustedPeople, Root

Omitting a FindType or StoreName will search all stores and common fields.
#>
[Parameter(Position=3)][Security.Cryptography.X509Certificates.StoreName]$StoreName,
<#
Whether to search the certificates of the CurrentUser or the LocalMachine.

Uses LocalMachine by default.
#>
[Parameter(Position=4)][Security.Cryptography.X509Certificates.StoreLocation]$StoreLocation = 'LocalMachine',
# Indicates that invalid and archived certificates should be included.
[Alias('Current')][switch]$Invalid,
# The encoding of the file to save.
[ValidateSet('ascii','bigendianunicode','default','oem','unicode','utf32','utf7','utf8')][string]$Encoding = 'utf8'
)
$find = @{FindValue=$FindValue;Valid=!$Invalid;NotArchived=!$Invalid}
if($FindType) {$find['FindType']=$FindType}
if($StoreName) {$find['StoreName']=$StoreName}
if($StoreLocation) {$find['StoreLocation']=$StoreLocation}

Find-Certificate.ps1 @find |
    ? HasPrivateKey |
    Show-CertificatePermissions.ps1 |
    Out-File $FilePath $Encoding
