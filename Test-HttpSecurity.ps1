﻿<#
.SYNOPSIS
Scan sites using Mozilla's Observatory.

.INPUTS
System.String containing a URL host to check.

.OUTPUTS
System.Management.Automation.PSObject containing scan results.

.LINK
Invoke-RestMethod

.LINK
https://observatory.mozilla.org/

.EXAMPLE
Test-HttpSecurity.ps1 www.example.net -Public

end_time             : Thu, 22 Dec 2016 00:09:31 GMT
grade                : F
hidden               : False
likelihood_indicator : MEDIUM
response_headers     : @{Accept-Ranges=bytes; Cache-Control=max-age=604800; Content-Encoding=gzip;
                       Content-Length=606; Content-Type=text/html; Date=Thu, 22 Dec 2016 00:09:31 GMT;
                       Etag="359670651+gzip"; Expires=Thu, 29 Dec 2016 00:09:31 GMT; Last-Modified=Fri, 09 Aug
                       2013 23:54:35 GMT; Server=ECS (sjc/4E3B); Vary=Accept-Encoding; X-Cache=HIT;
                       x-ec-custom-error=1}
scan_id              : 2899791
score                : 0
start_time           : Thu, 22 Dec 2016 00:09:29 GMT
state                : FINISHED
tests_failed         : 6
tests_passed         : 6
tests_quantity       : 12
results              : https://http-observatory.security.mozilla.org/api/v1/getScanResults?scan=2899791
host                 : www.example.net

.EXAMPLE
Test-HttpSecurity.ps1 www.example.com -IncludeResults

end_time             : Thu, 22 Dec 2016 16:17:17 GMT
grade                : F
hidden               : True
likelihood_indicator : MEDIUM
response_headers     : @{Accept-Ranges=bytes; Cache-Control=max-age=604800; Content-Encoding=gzip;
                       Content-Length=606; Content-Type=text/html; Date=Thu, 22 Dec 2016 16:17:17 GMT;
                       Etag="359670651+gzip"; Expires=Thu, 29 Dec 2016 16:17:17 GMT; Last-Modified=Fri, 09 Aug
                       2013 23:54:35 GMT; Server=ECS (sjc/4E5C); Vary=Accept-Encoding; X-Cache=HIT;
                       x-ec-custom-error=1}
scan_id              : 2903851
score                : 0
start_time           : Thu, 22 Dec 2016 16:17:16 GMT
state                : FINISHED
tests_failed         : 6
tests_passed         : 6
tests_quantity       : 12
results              : @{content-security-policy=; contribute=; cookies=; cross-origin-resource-sharing=;
                       public-key-pinning=; redirection=; referrer-policy=; strict-transport-security=;
                       subresource-integrity=; x-content-type-options=; x-frame-options=; x-xss-protection=}
host                 : www.example.com
#>

#Requires -Version 3
[CmdletBinding()][OutputType([psobject])] Param(
# Hostnames to scan, e.g. www.example.org
[Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$true)][string[]]$Hosts,
# Indicates a new scan should be performed, rather than returning a cached one.
[Alias('Rescan')][switch]$Force,
<#
Indicates the scan results may be posted publically.
By default, scans are unlisted.
#>
[switch]$Public,
# Indicates the detailed scan results should be fetched rather than simply providing a URL for them.
[Alias('Details','Results','FetchResults')][switch]$IncludeResults,
# The number of milliseconds to wait between polling the hostnames for scan completion.
[int]$PollingInterval = 1753,
# The address of the Observatory web service.
[Uri]$Endpoint = 'https://http-observatory.security.mozilla.org/api/v1'
)
Process
{
    $scan = @{}
    Write-Progress 'Mozilla Observatory Scan' 'Initiating scans'
    $i,$max = 0,($Hosts.Count/99.99)
    $Hosts |% {
        Write-Progress 'Mozilla Observatory Scan' 'Initiating scans' -CurrentOperation $_ -PercentComplete ($i++/$max)
        $scan.Add($_,(Invoke-RestMethod "$Endpoint/analyze?host=$_" -Body @{hidden=!$Public;rescan=$Force} -Method Post))
    }

    while([string[]]$pending = $scan.Keys |? {$scan.$_.state -like '*ING' -or
        !(Get-Member state -InputObject $scan.$_ -MemberType Properties)})
    {
        Write-Progress 'Mozilla Observatory Scan' "Waiting $PollingInterval ms" -PercentComplete ($pending.Count/$max)
        Start-Sleep -Milliseconds $PollingInterval
        $pending |% {
            Write-Progress 'Mozilla Observatory Scan' "Checking $_" -PercentComplete ($pending.Count/$max)
            $scan.$_ = Invoke-RestMethod "$Endpoint/analyze?host=$_"
        }
    }
    Write-Progress 'Mozilla Observatory Scan' -Completed

    $scan.Keys |% {
        $results = "$Endpoint/getScanResults?scan=$($scan.$_.scan_id)"
        if($IncludeResults) {$results = Invoke-RestMethod $results}
        Add-Member results $results -InputObject $scan.$_
        Add-Member host $_ -InputObject $scan.$_ -PassThru
    }
}
